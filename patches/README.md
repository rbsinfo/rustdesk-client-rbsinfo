# Instance patches

Put `*.patch` files here to change the RustDesk interface or behaviour beyond
what `client.env` and `custom.json` cover. They are applied with `git apply`,
in alphabetical order, after everything else.

To write one:

1. Clone RustDesk at the version you build (`rustdesk-version` in
   `.github/workflows/build.yml`), with its submodules.
2. Run `scripts/apply.py` from the generator against that clone, then commit.
3. Make your change, then `git diff > patches/0001-my-change.patch`.

A patch that no longer applies after a RustDesk upgrade stops the build with
an explicit error.
