# Task Master

Manage tasks efficiently

---

## Modules 🚀
Task master code is separated to multiple modules

├── Task master
│   ├── task_master_repo
│   │   ├── task_master_storage
│   ├── task_master_storage
│   └── task_master_ui

# task_master_ui 
contain basic project ui components

# task_master_repo
use repository design pattern to connect to endpoints and uses
task_master_storage to get tasks from local storage and other locally stored app data

# task_master_storage
Contains locally stored tasks and other app data like (token, userName ..)

each one of this modules can be separately developed, tested, reused.

## Start my app 🚀

This project contains 2 environments:

- development
- production

To run the desired environment either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --target .\lib\main_development.dart

# Production
$ flutter run --target .\lib\main_production.dart
```

_\*Task Master works on iOS, Android, Web, and Windows._

---

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_ar.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.

[coverage_badge]: coverage_badge.svg