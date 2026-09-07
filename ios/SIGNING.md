# iOS code signing

The Xcode project does not hardcode a team or bundle identifier any more. Both
come from xcconfig variables:

| Variable | Default (`Debug.xcconfig` / `Release.xcconfig`) | Used as |
| --- | --- | --- |
| `DEV_TEAM` | `38GTVL46PX` | `DEVELOPMENT_TEAM` |
| `BUNDLE_ID_SUFFIX` | *(empty)* | appended to `uz.xdido.hilolPrint` |

`Debug.xcconfig` and `Release.xcconfig` end with `#include? "LocalSigning.xcconfig"`,
so a git-ignored `ios/Flutter/LocalSigning.xcconfig` overrides both on your
machine only. CI and anyone without that file keeps building
`uz.xdido.hilolPrint` under the shared team.

## Running on a physical device with a free Apple ID

A free Apple ID gets a **Personal Team**: it can sign builds onto devices you
own, with three limits worth knowing — profiles expire after 7 days (rebuild
from Xcode to renew), you get 10 App IDs per week, and paid-only capabilities
(push notifications, App Groups, iCloud, associated domains) are unavailable.
This app ships no entitlements, so none of that blocks it.

1. **Add the Apple ID to Xcode** — Xcode > Settings > Accounts > **+** > Apple ID.
   This is the fix for `No Accounts: Add a new account in Accounts settings`.

2. **Find your Team ID** — Accounts > select the account; the Personal Team row
   shows it. From the terminal:

   ```bash
   security find-certificate -c "Apple Development" -p \
     | openssl x509 -noout -subject      # OU=... is the team id
   ```

3. **Create the local override:**

   ```bash
   cp ios/Flutter/LocalSigning.xcconfig.example ios/Flutter/LocalSigning.xcconfig
   ```

   Set `DEV_TEAM` to your Team ID. Keep `BUNDLE_ID_SUFFIX = .dev` — a Personal
   Team cannot issue a profile for `uz.xdido.hilolPrint` (that App ID belongs to
   the shared team), which is what
   `No profiles for 'uz.xdido.hilolPrint' were found` means.

4. **Check what resolved:**

   ```bash
   make ios-signing
   ```

5. **Run:**

   ```bash
   make run-ios                     # or: make run-ios DEVICE=<device id>
   ```

6. **Trust the certificate on the device** — first launch only. On the iPhone:
   Settings > General > VPN & Device Management > your Apple ID > Trust. The
   device must also be unlocked and paired.

## Switching back to the shared team

Delete `ios/Flutter/LocalSigning.xcconfig`. The defaults take over immediately;
nothing in the project file changes.
