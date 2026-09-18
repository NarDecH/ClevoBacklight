/* Clevo Backlight dashboard service worker (v1.9.15).
 *
 * Strategy: network-first for everything, so live data is always fresh;
 * the offline shell (this SW cached at install time) only answers when
 * the daemon is unreachable — the page itself renders "offline" state.
 * API calls are never cached (always live, never stale secrets).
 */
const CACHE = "clevo-dash-v1.9.15";
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

self.addEventListener("fetch", (ev) => {
  const url = new URL(ev.request.url);
  if (ev.request.method !== "GET" || url.pathname.startsWith("/api/")) {
    return;                                    // live data — never cached
  }
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
