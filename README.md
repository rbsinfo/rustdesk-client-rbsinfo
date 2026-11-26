# My remote support client

This repository builds a branded [RustDesk](https://github.com/rustdesk/rustdesk)
client with [rustdesk-client](https://github.com/rbsinfo/rustdesk-client).

| File | Purpose |
| --- | --- |
| `client.env` | Name, publisher, server address and public key |
| `custom.json` | Client settings (incoming only, enforced options) |
| `branding/icon.png` | Application icon, square, 1024x1024 |
| `branding/logo.png` | Optional logo shown on the home screen |
| `patches/` | Optional patches applied to the RustDesk sources |

Build: **Actions > Build client > Run workflow**. Release: push a tag `vX.Y.Z`.

The client is a modified version of RustDesk, distributed under the AGPL-3.0.
Every release attaches the complete corresponding source.
