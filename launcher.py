"""
launcher.py — single entry point for the packaged ClevoBacklight.exe.

Routing:
    ClevoBacklight.exe                  -> GUI
    ClevoBacklight.exe --daemon         -> tray daemon (boot restore / hotkeys)
    ClevoBacklight.exe --daemon --restore-only   -> apply saved settings, exit
    ClevoBacklight.exe --on --color FF0080 ...   -> CLI (clevo_ec)
    ClevoBacklight.exe --music          -> music-reactive CLI mode
    ClevoBacklight.exe --dump-ec        -> dump EC RAM (sensor hunting)
"""
import multiprocessing
import sys


def _is_cli_request(argv):
    cli_flags = {"--on", "--off", "--color", "--zone", "--mode", "--brightness",
                 "--speed", "--read", "--save", "--apply-saved", "--music",
                 "--sensitivity", "--profile", "--ambient", "--mix", "--temp",
                 "--source", "--interval", "--reg", "--dump-ec", "--fan",
                 "--fan-duty", "--help", "-h"}
    return any(a in cli_flags for a in argv)


def main():
    multiprocessing.freeze_support()
    argv = sys.argv[1:]
    if "--smoke-test" in argv:      # hardware smoke test via the GUI module
        import clevo_backlight_gui
        clevo_backlight_gui.main()
        return
    if "--daemon" in argv:
        import clevo_daemon
        if "--restore-only" in argv:
            d = clevo_daemon.Daemon()
            try:
                d.apply("restore-only")
            finally:
                try:
                    if d.kb is not None:
                        d.kb.close()
                except Exception:
                    pass
        else:
            clevo_daemon.Daemon().run()
        return
    if _is_cli_request(argv):
        import clevo_ec
        clevo_ec.main()
        return
    import clevo_backlight_gui
    clevo_backlight_gui.main()


if __name__ == "__main__":
    main()
