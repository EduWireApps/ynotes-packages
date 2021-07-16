# Theme

Themes are located in [/themes](themes/).

## Usage

### Import the library

```dart
import 'package:ynotes_packages/theme.dart';
```

### Use the theme

```dart
final Color danger = theme.colors.danger.shade300;
```

### Set current theme

```dart
theme.currentTheme = YAvailableTheme.light;
```

## Colors

Each colors contains 5 shades: 100, 200, 300, 400 and 500. `shade100` is the lightest and `shade500` the darkest.

## Add a theme

#### STEP 1

Create a folder: `lib/src/theme/themes/mytheme`

#### STEP 2

In `lib/src/theme/theme.dart`, add your theme to the the list and to the enum:

```dart
import 'themes/mytheme/theme.dart';

// some code you don't care about

enum YAvailableTheme { system, light, dark, mytheme }
final List<YTheme> _themes = [lightTheme, darkTheme, mythemeTheme];

```

#### STEP 3

Create the file: `lib/src/theme/themes/mytheme/theme.dart`. Inside put:

```dart
import 'package:ynotes_packages/src/theme/theme.dart';

import 'colors.dart';
import 'button_styles.dart';

final YTheme mythemeTheme =
    YTheme("mytheme", theme: YAvailableTheme.mytheme, isDark: <true or false>, colors: colors, buttonStyles: buttonStyles);
```

### STEP 4

Copy `colors.dart` and `button_styles.dart` from the light theme and adapt them.

## Available themes

- Light
- Dark
- System: Detect OS theme. If it can't, it uses the light theme as a fallback.