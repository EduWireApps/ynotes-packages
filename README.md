**!!! OUTDATED !!!**

# ynotes-packages

**1rem = 6.sp**

The yNotes' UI components library. It also contains the themes.

## Theming

Themes are located in `lib/src/theme/themes`.

### Adding a theme

#### STEP 1

Create a folder: `lib/src/theme/themes/mytheme`

#### STEP 2

In `lib/src/theme/theme.dart`, add your theme to the the list and to the enum:

```dart
import 'themes/mytheme/theme.dart';

// some code you don't care about

enum YAvailableTheme { light, dark, mytheme }
final List<YTheme> themes = [lightTheme, darkTheme, mythemeTheme];

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

## Components

### YHorizontalSpacer `Done`

Creates an empty horizontal space.

#### Example

```dart
YHorizontalSpacer(10)
```
### YVerticalSpacer `Done`

Creates an empty vertical space.

#### Example

```dart
YVerticalSpacer(10)
```

### YShadowScrollContainer `Done`

Vertical scroll area (`ListView`) that adds shadow to the top and the bottom when the concerning side hasn't been reached.

#### Parameters

- `children` (required): `List<Widget>` **CAUTION When using a `ListView` widget**: It must have `shrinkWrap` set to `true` and `phyiscs` to `ClampingScrollPhysics()`.
- `color` (required): `Color` It must be the same color than the background.

#### Example

```dart
YShadowScrollContainer(
    color: Colors.red,
    children: [
        Container(),
        ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [/* whatever */]
        )
    ]
)
```

### YButton `Done`

A button obviously.

#### Parameters

- `text` (required): `String` The text to display
- `onPressed` (required): `VoidCallback` The event to trigger when clicking the button, can be null
- `onLongPressed`: `VoidCallback?` The event to trigger when holding the button
- `type`: `YColor` The button type
- `variant`: `YButtonVariant` The button variant
- `icon`: `IconData?` The icon placed to the left of the text by default, can be null
- `isLoading`: `bool` The button's loading state
- `isDisabled`: `bool` The button's availability state
- `reverseIconAndText`: `bool` Reverses the text and icon order

Default

```dart
YButton(
    onLongPressed: null,
    type: YColor.primary,
    variant: YButtonVariant.plain,
    icon: null,
    isLoading: false,
    isDisabled: false,
    reverseIconAndText: false
)
```

#### Example

```dart
YButton(
    text: "View more",
    icon: Icons.check_circle,
    onPressed: () => print("clicked!"),
    type: YColor.warning,
    isDisabled: true
)
```

### YCheckbox `Done`

A checkbox. Value is a boolean.

#### Parameters

- `value` (required): `bool` The default value
- `onChanged` (required): `void Function(bool)` The event to trigger when the value is updated
- `type`: `YColor` The checkbox type. _YColor.primary_ by default

#### Example

```dart
YCheckbox(
    value: false,
    onChanged: (bool value) => print("New value: ${value!}"),
    type: YColor.success
)
```

### YSwitch `Done`

A switch. Value is a boolean.

#### Parameters

- `value` (required): `bool` The default value
- `onChanged` (required): `void Function(bool)` The event to trigger when the value is updated
- `type`: `YColor` The checkbox type. _YColor.primary_ by default

#### Example

```dart
YSwitch(
    value: false,
    onChanged: (bool value) => print("New value: ${value!}"),
    type: YColor.success
)
```

### YChoiceDialog `Done`

A dialog to get the user choice as a boolean (`Future<bool>`).

Must be called using `YDialogs.getChoice()` (See the example below).

#### Parameters

- `type` (required): `YColor` The color type of the dialog. **CAUTION:** The neutral color can't be used there, will throw an error.
- `title` (required): `String`
- `description` (required): `String`
- `icon` (required): `IconData`

#### Example

```dart
final bool choice = await YDialogs.getChoice(context, YChoiceDialog(
    type: YColor.danger,
    title: "Hep !",
    description: "T'es sûr(e) de vouloir faire ça ?",
    icon: Icons.error_outline,
));
```

### YConfirmationDialog `Done`

A dialog to let the user know something.

Must be called using `YDialogs.getConfirmation()` (See the example below).

#### Parameters

- `type` (required): `YColor` The color type of the dialog. **CAUTION:** The neutral color can't be used there, will throw an error.
- `title` (required): `String`
- `description` (required): `String`
- `icon` (required): `IconData`
- `buttonLabel`: `String` _"Confirmer"_ by default

#### Example

```dart
await YDialogs.getConfirmation(context, YConfirmationDialog(
    type: YColor.danger,
    title: "Hep !",
    description: "Ca a pas marché.",
    icon: Icons.error_outline,
));
```

### YListDialog `Done`

A dialog to let the user choose an element from a list.

Must be called using `YDialogs.getListChoice()` (See the example below).

#### Parameters

- `elements` (required): `YListDialogElement` The list of elements
- `header` : `YDialogHeader?` an optional header
- `fixedHeader` : `bool` Define if the header is part of the scrollable area or not. _true_ by default

#### Example

```dart
final YListDialogElement? res = await YDialogs.getListChoice(
    context, YListDialog(
        header: YDialogHeader(
            type: YColor.success,
            title: "Choose",
            icon: Icons.list),
        headerFixed: false,
        elements: [
            YListDialogElement(title: "Element 0", description: "This is element 0.", icon: Icons.error, value: 0),
            YListDialogElement(title: "Element 1", icon: Icons.warning, value: 1),
            YListDialogElement(title: "Element 2", description: "This is element 2.", value: 2),
        ],
    )
);
));
```

### YListMultipleDialog `Done`

A dialog to let the user choose an element from a list.

Must be called using `YDialogs.getListChoice()` (See the example below).

#### Parameters

- `elements` (required): `YListDialogElement` The list of elements
- `header` : `YDialogHeader?` an optional header
- `fixedHeader` : `bool` Define if the header is part of the scrollable area or not. _true_ by default
- `type`: `YColor` The button type used for confirmation button and checkboxes. _YColor.primary_ by default
- `min`: `int` The minimum required selected elements. Set to _0_ by default
- `max`: `int?` The maximum required selected elements. If not set, it uses `elements.length`.

Hints are displayed to help the user depending on `min` and `max` values.

#### Example

```dart
final List<YListMultipleDialogElement>? res = await YDialogs.getListSelected(
    context, YListDialog(
        min: 1,
        max: 2,
        type: YColor.success,
        header: YDialogHeader(
            type: YColor.success,
            title: "Choose",
            icon: Icons.list),
        headerFixed: false,
        elements: [
            YListMultipleDialogElement(
                id: 0,
                title: "Element 0",
                description: "This is element 0",
                value: false),
            YListMultipleDialogElement(
                id: 1,
                title: "Element 1",
                value: true),
        ],
    )
);
));
```

<hr />

**REMAINING COMPONENTS MUST BE DOCUMENTED**

### In progress

- YDialogHeader
- YListDialogTile
- YListDialogTileDivider

### Coming soon

- YDropdown
- YInput
- YPage

More to come