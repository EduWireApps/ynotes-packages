# Theme

## Setting up

This packages can be setup in 3 ways:

- [Using the `config` package [RECOMMENDED]](#using-the-config-package-recommended)
- [Using the theme variable from the `theme` package](#using-the-theme-variable-from-the-theme-package)
- [Using your own theme variable](#using-your-own-theme-variable)

### Using the `config` package [RECOMMENDED]

```dart
import 'package:flutter/material.dart';
import 'package:ynotes_packages/config.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
}

// It could be a statful widget but it's not needed
// for this example
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        // This is the widget exposed by the config package
        // To know more, check out its documentation
        return YApp(
            initialTheme: 0,
            themes: themes // more on that below
            builder: (context) => MaterialApp(...);
        );
    }
}
```

Then to use the theme:

```dart
import 'package:ynotes_packages/theme.dart';

// access the theme variable
final Color color = theme.colors.backgroundColor
```

### Using the theme variable from the `theme` package

```dart
import 'package:flutter/material.dart';
import 'package:ynotes_packages/theme.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    theme = YCurrentTheme(currentTheme: 0, themes: themes) // more on that below
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(...);
    }
}
```

Then to use the theme:

```dart
import 'package:ynotes_packages/theme.dart';

// access the theme variable
final Color color = theme.colors.backgroundColor
```

### Using your own theme variable

**PLEASE NOTE: with this approach, you can't use the `components` library.**

You first need to define it somewhere.

For example, in `lib/global.dart`:

```dart
import 'package:ynotes_packages/theme.dart';

final YCurrentTheme theme = YCurrentTheme(currentTheme: 0, themes: themes); // more on that below
```

You can then use it by importing that file.

```dart
import 'package:your_app/global.dart';

// access the theme variable
final Color color = theme.colors.backgroundColor
```

## The themes

In the setup section, you've seen the themes variable used to initialize the theme.

You have to create it and here is how:

### Creating a theme

First of all, you need to create at least a theme. We usually put it in `themes/my_theme.dart`.

```dart
final YTheme myTheme = YTheme(
    "My theme",
    id: 0,
    isDark: false,
    colors: _colors,
    fonts: themeFonts,
    texts: texts
);
```

Let's see how to define `_colors`, `themeFonts` and `texts`.

### Creating the `_colors` variable

We recommend keeping it private by adding the `_` prefix to it because it doesn't have to be shared with other themes.

```dart
final YTColors _colors = YTColors(
    backgroundColor: Colors.white,
    backgroundLightColor: Colors.grey[200]!,
    foregroundColor: Colors.grey[850]!,
    foregroundLightColor: Colors.grey[700]!,
    primary: _primary,
    secondary: _secondary,
    success: _success,
    warning: _warning,
    danger: _danger);
```

And for each private variable like `_primary`, this is a variable of `YTColor`.

```dart
final YTColor _primary = YTColor(
  foregroundColor: Colors.white,
  lightColor: Colors.indigo[300]!.withOpacity(.5),
  backgroundColor: Colors.indigo[600]!,
);
```

The `lightColor` should have an opacity <= 0.8.

### Creating the `themeFonts` variable

We think that this variable must be shared accross the themes so we usually put it in `themes/utils/fonts.dart`.

```dart
final YTFonts themeFonts = YTFonts(primary: "Roboto", secondary: "Montserrat");
```

It musts correspond to the fonts names in the `assets` section of your `pubspec.yaml` or to a Google Font family name.

### Defining the `texts` variable

This variable contains all the texts variables of your app. We think that it must be shared accross the themes so we usually put it in `themes/utils/texts.dart`.

```dart
final YTTexts texts = YTTexts(
    // ...
    title: TextStyle(fontFamily: theme.fonts.primary)
);
```

But if you're using Google Fonts (and we recommend it), the setup is a bit different.

First here is an helper function:

```dart
TextStyle getTextStyle(TextStyle style, {bool primaryFontFamily = false, YTFonts? fonts}) =>
    GoogleFonts.getFont(primaryFontFamily ? (fonts ?? theme.fonts).primary : (fonts ?? theme.fonts).secondary,
        textStyle: style);
```

And then use it like so:

```dart
YTTexts texts(YTColors colors, YTFonts fonts) => YTTexts(
    // ...
    title: getTextStyle(TextStyle(
        TextStyle(
            // ...
            // don't put fontFamily there
        ),
        primaryFontFamily: true,
        fonts: fonts
    ))
);
```

And so in your theme, replace the `texts` variable by `texts(_colors, themeFonts)`.

### Listing the themes

Now that we have our theme (you can add as much as you want), we have to put it in the list of the available themes. In `themes/themes.dart`:

```dart
import 'package:ynotes_packages/theme.dart';
import 'my_theme.dart';

final List<YTheme> themes = [myTheme];
```

And that's it!

## Examples

### The system theme

This theme is quite special because it needs to know when the OS brightness updates, and it needs the light and dark theme.

Assuming we have the following files:

```text
--themes/
  --dark.dart
  --light.dart
  --system.dart
  --themes.dart
```

In `light.dart` we have a `lightTheme` and in `dark.dart` there is a `darkTheme.`

So here is our system theme:

```dart
import 'dark.dart';
import 'light.dart';
import 'package:flutter/material.dart';
import 'package:ynotes_packages/theme.dart';

YTheme systemTheme(Brightness brightness) {
    final bool darkModeOn = brightness == Brightness.dark;
    // Based on the brightness, we take the right theme
    final YTheme t = darkModeOn ? darkTheme : lightTheme;
    final YTheme theme = YTheme(
        "System",
        id: 0,
        isDark: darkModeOn,
        colors: t.colors,
        splashColor: t.splashColor,
        fonts: t.fonts,
        texts: t.texts);
    return theme;
}
```

So we need to pass the OS brigthness to the systemTheme.

So in `themes.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:ynotes_packages/theme.dart';
import 'light.dart';
import 'dark.dart';
import 'system.dart';

List<YTheme> themes(Brightness brightness) => [systemTheme(brightness), lightTheme, darkTheme];
```

And here same same thing, we need the brightness. So in our app entrypoint (`main.dart`), we need to setup it in a particular way.

Using the `config` package:

```dart
import 'package:flutter/material.dart';
import 'package:ynotes_packages/config.dart';
import 'themes/themes.dart';

void main() {
    // required
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
}

class MyApp extends StatefulWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    // we prepare our state variable
    late Brightness _brightness;

    // we create a method to avoid copy-paste
    void setBrightness(Brightness brightness) {
        setState(() {
            _brightness = brightness;
        });
  }

    @override
    void initState() {
        super.initState();
        // when the widget first launches, we set an event listener
        // to update the brightness each times it updates
        final window = WidgetsBinding.instance!.window;
        window.onPlatformBrightnessChanged = () {
            setBrightness(window.platformBrightness);
        };
        // we set the brightness
        setBrightness(window.platformBrightness);
    }

    @override
    Widget build(BuildContext context) => YApp(
        initialTheme: 0,
        // we pass the brightness as a parameter
        themes: themes(_brightness),
        builder: (context) => MaterialApp(...));
}
```
