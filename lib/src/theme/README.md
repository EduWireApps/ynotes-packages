# Theme

## Usage

### Import the library

```dart
import 'package:ynotes_packages/theme.dart';
```

### Define the theme

In your app main function:

```dart
void main() {
    theme = YCurrentTheme(currentTheme: 0, themes: themes, fontFamily: "<font name>");
    // ...
}
// ...
MaterialApp(
    theme: theme.themeData
)
```

### Use the theme

```dart
final Color danger = theme.colors.danger.shade300;
```

### Set current theme

```dart
theme.currentTheme = 1;
```

## Colors

Each colors contains 5 shades: 100, 200, 300, 400 and 500. `shade100` is the lightest and `shade500` the darkest.

## Add a theme

Check out the [example](/example/lib/themes).

#### STEP 1

In your project, create a folder: `/themes/mytheme`

#### STEP 2

Create the file: `mytheme/theme.dart`. Inside put:

```dart
import 'package:ynotes_packages/theme.dart';

import 'colors.dart';
import 'variable_styles.dart';

final YTheme mythemeTheme =
    YTheme("mytheme", id: 0, isDark: <true or false>, colors: colors, variableStyles: variableStyles);
```

### STEP 3

Copy `colors.dart` and `button_styles.dart` from the light theme of the example and adapt them.

#### STEP 4

In `/themes/themes.dart`, add your theme to the the list:

```dart
import 'package:ynotes_packages/theme.dart';
import 'mytheme/theme.dart';

final List<YTheme> themes = [mythemeTheme];
```

You can now import it to initialize the theme system in the main function.
