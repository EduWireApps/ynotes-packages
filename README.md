# ynotes-components

The yNotes' UI components library. It also contains the themes.

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

#### Parameters:

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

#### Parameters:

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

<hr />


**REMAINING COMPONENTS MUST BE DOCUMENTED**

### In progress

- YButton
- YChoiceDialog
- YCard
- YConfirmationDialog
- YH1
- YH2
- YH3
- YTextBody

### Coming soon

- YListDialog
- YListMultipleDialog
- YDropdown
- YPage
- YLocalPage

More to come

## Mixins

- YDialogMixin (WIP)