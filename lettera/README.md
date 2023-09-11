# lettera

Application can a bit modify text for your needs

---
## Todo:
[] .dmg files for install app on macOS
[] .exe file for install app on Windows
---

## Versioning
* Flutter 3.10.6 • channel stable • https://github.com/flutter/flutter.git
* Framework • revision f468f3366c (8 weeks ago) • 2023-07-12 15:19:05 -0700
* Engine • revision cdbeda788a
* Tools • Dart 3.0.6 • DevTools 2.23.1

---

## Running

You need the lib/src/config/_firebase.dart file to run the application on the web. You should contact the author for the file.

Run command:

```
 $ flutter clean
 $ flutter pub get
 $ flutter pub run build_runner build --delete-conflicting-outputs
 $ flutter run
```

---

## Supported platforms
| macOS | Web |

---

## Preparing builds for deploy

- #### Web

For publishing the web app, you should have [firebase sdk installed](https://firebase.google.com/docs/web/setup)

```
 $ flutter build web --release

 $ firebase deploy --project lettera-app
```

Link for [Web app](https://lettera-app.web.app)

- #### macOS

```
 $ flutter build macOS --release
```
