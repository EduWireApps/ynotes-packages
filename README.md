# ynotes-packages

> Sorry French users, this repo is only in english.

This repo contains 1 package splitted in 5 libraries:

## Libraries

### [Components](lib/src/components)

Contains useful components such as `YButton`. It relies on [theme](#theme) and [utilities](#utilities) libraries. Check out the [README](lib/src/components/README.md).

Inspired by [Supabase Ui](https://ui.supabase.io) and [Signal](https://signal.org) interfaces.

Import it:

```dart
import 'package:ynotes_packages/components.dart';
```

### [Config](lib/src/config)

Provides tools to setup themes that must be stored in the app. (instructions in the README). Check out the [README](lib/src/config/README.md).

Import it:

```dart
import 'package:ynotes_packages/config.dart';
```

### [Theme](lib/src/theme)

Provides tools to setup themes that must be stored in the app. (instructions in the README). Check out the [README](lib/src/theme/README.md).

Import it:

```dart
import 'package:ynotes_packages/theme.dart';
```

### [Utilities](lib/src/utilities)

Contains utilities such as `YFontSize`, inspired by [Tailwind CSS](https://tailwindcss.com) approach. Check out the [README](lib/src/utilities/README.md)

Import it:

```dart
import 'package:ynotes_packages/utilities.dart';
```

### [Settings](lib/src/settings)

Contains useful components for settings such as `YSettingTile`. It relies on [theme](#theme), [components](#components) and [utilities](#utilities) libraries. Check out the [README](lib/src/settings/README.md).

Inspired by [flutter-settings-ui](https://github.com/yako-dev/flutter-settings-ui) and [Signal](https://signal.org) interfaces.

Import it:

```dart
import 'package:ynotes_packages/settings.dart';
```

## Packages used

Under the hood, this packages uses:

- [another_flushbar](https://pub.dev/packages/another_flushbar)
- [flutter](https://flutter.dev)
- [flutter_switch](https://pub.dev/packages/flutter_switch)
- [flutter_responsive_breakpoints](https://pub.dev/packages/flutter_responsive_breakpoints)
- [intl](https://pub.dev/packages/intl)
- [uuid](https://pub.dev/packages/uuid)
- [provider](https://pub.dev/packages/provider)

---

Maintained by [Florian LEFEBVRE](https://github.com/florian-lefebvre).
