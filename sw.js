/* Clevo Backlight dashboard service worker (v1.9.16).
 *
 * Strategy:
 *  - everything: network-first, so live data is always fresh; the offline
 *    shell (cached at install time) only answers when the daemon is down.
 *  - /api/status: cache-first with a 15 s TTL — while fresh it is answered
 *    from cache, when stale it refreshes from the network, and when the
 *    daemon is unreachable the LAST KNOWN STATUS is served so the page
 *    keeps rendering (the page overlays its own "offline" banner).
 *  - every other /api/* call is never cached (always live, no stale
 *    secrets); POSTs while offline are queued by the page itself.
 */
const CACHE = "clevo-dash-v1.9.16";
const STATUS_TTL_MS = 15000;                 // matches the 5 s page refresh x3
const SHELL = [
  "/manifest.webmanifest",
  "/icon-192.png",
  "/icon-512.png",
];

self.addEventListener("install", (ev) => {
  ev.waitUntil(
    caches.open(CACHE).then((c) => c.addAll(SHELL)).then(() => self.skipWaiting())
  );
});

self.addEventListener("activate", (ev) => {
  ev.waitUntil(
    caches.keys()
      .then((keys) => Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

/* status cache: fresh -> hit, stale -> refresh, offline -> last known */
async function statusWithTtl(request){
  const cache = await caches.open(CACHE);
  const cached = await cache.match("/api/status");
  if (cached){
    const at = +(cached.headers.get("x-cached-at") || 0);
    if (at && Date.now() - at < STATUS_TTL_MS) return cached;
  }
  try{
    const resp = await fetch(request);
    if (resp.ok){
      const clone = resp.clone();
      const headers = new Headers(clone.headers);
      headers.set("x-cached-at", String(Date.now()));
      const stamped = new Response(await clone.arrayBuffer(), {
        status: clone.status, statusText: clone.statusText, headers: headers});
      await cache.put("/api/status", stamped);   // fixed key: token-agnostic
      return resp;
    }
    return resp;
  }catch(e){
    return cached || Response.error();
  }
}

self.addEventListener("fetch", (ev) => {
  const url = new URL(ev.request.url);
  if (ev.request.method !== "GET") return;
  if (url.pathname === "/api/status"){
    ev.respondWith(statusWithTtl(ev.request));
    return;
  }
  if (url.pathname.startsWith("/api/")) return;  // live data — never cached
  ev.respondWith(
    fetch(ev.request)
      .then((resp) => {
        if (resp.ok && url.pathname === "/") {
          const clone = resp.clone();
          caches.open(CACHE).then((c) => c.put("/", clone));
        }
        return resp;
      })
      .catch(() =>
        url.pathname === "/"
          ? caches.match("/").then((r) => r || Response.error())
          : caches.match(ev.request).then((r) => r || Response.error())
      )
  );
});
