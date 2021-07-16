# Components

## Usage

1 - Import the library:

```dart
import 'package:ynotes_packages/components.dart';
```

2 - Install `flutter_responsive_breakpoints`.

3 - Wrap your `MaterialApp` with `Responsive`:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Responsive(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: MyHomePage(),
        ),
      );
}
```

4 - Initialise the theme ([see the documentation](/lib/src/theme/README.md)).

Check out the example provided with each component.

## Table of contents

- [Components](#components)
  - [Usage](#usage)
  - [Table of contents](#table-of-contents)
  - [Components](#components-1)
    - [YHorizontalSpacer `Done`](#yhorizontalspacer-done)
      - [Example](#example)
    - [YVerticalSpacer `Done`](#yverticalspacer-done)
      - [Example](#example-1)
    - [YShadowScrollContainer `Done`](#yshadowscrollcontainer-done)
      - [Parameters](#parameters)
      - [Example](#example-2)
    - [YButton `Done`](#ybutton-done)
      - [Parameters](#parameters-1)
      - [Example](#example-3)
    - [YCheckbox `Done`](#ycheckbox-done)
      - [Parameters](#parameters-2)
      - [Example](#example-4)
    - [YSwitch `Done`](#yswitch-done)
      - [Parameters](#parameters-3)
      - [Example](#example-5)
    - [YChoiceDialog `Done`](#ychoicedialog-done)
      - [Parameters](#parameters-4)
      - [Example](#example-6)
    - [YConfirmationDialog `Done`](#yconfirmationdialog-done)
      - [Parameters](#parameters-5)
      - [Example](#example-7)
    - [YListDialog `Done`](#ylistdialog-done)
      - [Parameters](#parameters-6)
      - [Example](#example-8)
    - [YListMultipleDialog `Done`](#ylistmultipledialog-done)
      - [Parameters](#parameters-7)
      - [Example](#example-9)
    - [YDialogBase `Done`](#ydialogbase-done)
      - [Parameters](#parameters-8)
    - [YDialogHeader `Done`](#ydialogheader-done)
      - [Parameters](#parameters-9)
    - [YDialogTextBody `Done`](#ydialogtextbody-done)
      - [Example](#example-10)
    - [YListDialogTile `Done`](#ylistdialogtile-done)
      - [Parameters](#parameters-10)
      - [Example](#example-11)
    - [YListDialogTileDivider `Done`](#ylistdialogtiledivider-done)
      - [Example](#example-12)
    - [YDropdown `Soon`](#ydropdown-soon)
    - [YBottomSheet `Soon`](#ybottomsheet-soon)
    - [YInput `Soon`](#yinput-soon)
    - [YPage `Soon`](#ypage-soon)
  - [Miscellaneous](#miscellaneous)
    - [YDialogs](#ydialogs)
      - [Example](#example-13)
    - [YListDialogElement](#ylistdialogelement)
      - [Example](#example-14)
    - [YListMultipleDialogElement](#ylistmultipledialogelement)
      - [Example](#example-15)

## Components

> When using double or num, use `YScale` instead of a arbitrary value.

### YHorizontalSpacer `Done`

Creates an empty horizontal space.

#### Example

```dart
YHorizontalSpacer(YScale.s8)
```

### YVerticalSpacer `Done`

Creates an empty vertical space.

#### Example

```dart
YVerticalSpacer(YScale.s8)
```

### YShadowScrollContainer `Done`

Vertical scroll area (`ListView`) that adds shadow to the top and the bottom when the concerning side hasn't been reached.

#### Parameters

| Name       | Type           | Required | Default value | Description                                                                                                                     |
| ---------- | -------------- | -------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| children   | `List<Widget>` | Yes      | -             | **CAUTION When using a `ListView` widget**: It must have `shrinkWrap` set to `true` and `phyiscs` to `ClampingScrollPhysics()`. |
| color      | `Color`        | Yes      | -             | It must be the same color than the background.                                                                                  |
| shrinkWrap | `bool`         | No       | `false`       | Sets ListView shrinkWrap and set physics to `ClampingScrollPhysics()` if `true`.                                                |

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

| Name           | Type             | Required | Default value          | Description                                                                |
| -------------- | ---------------- | -------- | ---------------------- | -------------------------------------------------------------------------- |
| text           | `String`         | Yes      | -                      | The text to display                                                        |
| onPressed      | `VoidCallback`   | Yes      | -                      | The event to trigger when clicking the button                              |
| onLongPressed  | `VoidCallback?`  | No       | `null`                 | The event to trigger when holding the button                               |
| type           | `YColor`         | No       | `YColor.primary`       | -                                                                          |
| variant        | `YButtonVariant` | No       | `YButtonVariant.plain` | -                                                                          |
| icon           | `IconData?`      | No       | `null`                 | The icon placed to the left of the text by default                         |
| isLoading      | `bool`           | No       | `false`                | If true, it can't be clicked and there is a spinner instead of the content |
| isDisabled     | `bool`           | No       | `false`                | If true, it can't be clicked                                               |
| isIconReversed | `bool`           | No       | `false`                | If true, puts the icon to the right                                        |

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

| Name      | Type                  | Required | Default value    | Description                                    |
| --------- | --------------------- | -------- | ---------------- | ---------------------------------------------- |
| value     | `bool`                | Yes      | -                | -                                              |
| onChanged | `void Function(bool)` | Yes      | -                | The event to trigger when the value is updated |
| type      | `YColor`              | No       | `YColor.primary` | -                                              |

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

| Name      | Type                  | Required | Default value    | Description                                    |
| --------- | --------------------- | -------- | ---------------- | ---------------------------------------------- |
| value     | `bool`                | Yes      | -                | -                                              |
| onChanged | `void Function(bool)` | Yes      | -                | The event to trigger when the value is updated |
| type      | `YColor`              | No       | `YColor.primary` | -                                              |

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

| Name        | Type       | Required | Default value | Description                                                                                           |
| ----------- | ---------- | -------- | ------------- | ----------------------------------------------------------------------------------------------------- |
| type        | `YColor`   | Yes      | -             | The color type of the dialog. **CAUTION:** The neutral color can't be used there, will throw an error |
| title       | `String`   | Yes      | -             | -                                                                                                     |
| description | `String`   | Yes      | -             | -                                                                                                     |
| icon        | `IconData` | Yes      | -             | -                                                                                                     |

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

| Name        | Type       | Required | Default value | Description                                                                                           |
| ----------- | ---------- | -------- | ------------- | ----------------------------------------------------------------------------------------------------- |
| type        | `YColor`   | Yes      | -             | The color type of the dialog. **CAUTION:** The neutral color can't be used there, will throw an error |
| title       | `String`   | Yes      | -             | -                                                                                                     |
| description | `String`   | Yes      | -             | -                                                                                                     |
| icon        | `IconData` | Yes      | -             | -                                                                                                     |
| buttonLabel | `String`   | No       | `Confirmer`   | -                                                                                                     |

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

| Name        | Type                       | Required | Default value | Description                                                |
| ----------- | -------------------------- | -------- | ------------- | ---------------------------------------------------------- |
| elements    | `List<YListDialogElement>` | Yes      | -             | -                                                          |
| header      | `YDialogHeader?`           | No       | `null`        | Optional header                                            |
| fixedHeader | `bool`                     | No       | `true`        | Define if the header is part of the scrollable area or not |

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

| Name        | Type                       | Required | Default value     | Description                                                 |
| ----------- | -------------------------- | -------- | ----------------- | ----------------------------------------------------------- |
| elements    | `List<YListDialogElement>` | Yes      | -                 | -                                                           |
| header      | `YDialogHeader?`           | No       | `null`            | Optional header                                             |
| fixedHeader | `bool`                     | No       | `true`            | Define if the header is part of the scrollable area or not  |
| type        | `YColor`                   | No       | `YColor.primary`  | The button type used for confirmation button and checkboxes |
| min         | `int`                      | No       | `0`               | The minimum required selected elements.                     |
| max         | `int?`                     | No       | `elements.length` | The maximum required selected elements.                     |

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

### YDialogBase `Done`

Dialog base, can be used to create custom dialogs.

#### Parameters

| Name        | Type           | Required | Default value | Description            |
| ----------- | -------------- | -------- | ------------- | ---------------------- |
| children    | `List<Widget>` | Yes      | -             | -                      |
| topFixed    | `Widget?`      | No       | `null`        | Usually for the header |
| bottomFixed | `Widget?`      | No       | `null`        | Usually for the footer |

### YDialogHeader `Done`

A header to use in dialogs.

#### Parameters

| Name  | Type       | Required | Default value | Description |
| ----- | ---------- | -------- | ------------- | ----------- |
| type  | `YColor`   | Yes      | -             | -           |
| title | `String`   | Yes      | -             | -           |
| icon  | `IconData` | Yes      | -             | -           |

### YDialogTextBody `Done`

A widget to use when displaying text in a dialog body.

#### Example

```dart
YDialogTextBody("Some text")
```

### YListDialogTile `Done`

The tile used in dialog with lists.

#### Parameters

| Name        | Type           | Required | Default value | Description                        |
| ----------- | -------------- | -------- | ------------- | ---------------------------------- |
| onTap       | `VoidCallback` | Yes      | -             | The event to trigger on tap        |
| title       | `String`       | Yes      | -             | -                                  |
| description | `String?`      | No       | `null`        | -                                  |
| leading     | `Widget?`      | No       | `null`        | Can be anything: icon, checkbox... |

#### Example

```dart
YListDialogTile(
    onTap: () => print("tile tapped!"),
    title: "Title",
    description: "description",
    leading: YCheckbox(
        value: true,
        onChanged: (bool value) => print("New value: ${value!}"),
        type: YColor.success,
    )
)
```

### YListDialogTileDivider `Done`

Creates an horizontal divider. To use with `YListDialogTile`.

#### Example

```dart
YListDialogTileDivider()
```

### YDropdown `Soon`

Will be available in the near future.

### YBottomSheet `Soon`

Will be available in the near future.

### YInput `Soon`

Will be available in the near future.

### YPage `Soon`

Will be available in the near future.

## Miscellaneous

### YDialogs

A static class to call all dialogs from the library.

#### Example

```dart
final bool choice = await YDialogs.getChoice(context, YChoiceDialog(
    type: YColor.danger,
    title: "Hep !",
    description: "T'es sûr(e) de vouloir faire ça ?",
    icon: Icons.error_outline,
));
```

### YListDialogElement

An element to use in `YListDialog` (`elements` argument).

#### Example

```dart
YListDialogElement(title: "Element 0", description: "This is element 0.", icon: Icons.error, value: 0)
```

### YListMultipleDialogElement

An element to use in `YListMultipleDialog` (`elements` argument).

#### Example

```dart
YListMultipleDialogElement(
    id: 0,
    title: "Element 0",
    description: "This is element 0",
    value: false)
```
