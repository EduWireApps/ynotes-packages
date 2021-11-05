# Config

This package is the best way to work with the other libraries. It features:

- A widget to wrap around `MaterialApp`
- An helper function to update the current theme
- the [`flutter_responsive_breakpoints` package](https://pub.dev/packages/flutter_responsive_breakpoints)

## The `YApp` widget

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
        // The widget
        return Responsive(builder: (context) => YApp(
            initialTheme: 0,
            themes: themes // See the theme documentation to know more
            builder: (context) => MaterialApp(...);
        ));
    }
}
```

## The function

You can use `updateCurrentTheme(i)` to set the currentTheme to the one thats has for id `i`.

## The `flutter_responsive_breakpoints` package

Importing the `config` package is the same as importing the `flutter_responsive_breakpoints` package so you don't have to install it (in fact, the components rely on it).

Here is the [documentation](https://pub.dev/packages/flutter_responsive_breakpoints).