# 0.6.6 (02/02/2022)

- Use the `equatable` package for `YTColor`

# 0.6.5 (31/01/2022)

- Fix `YPage` tab controller that caused `late initialization` error

# 0.6.4 (07/01/2022)

- Fix `YModalBottomSheets.show` to resize the bottom sheet when keyboard is open
- Pressing anywhere on bottom sheet unfocuses currently focused input

# 0.6.3 (07/01/2022)

- `YPage` body has been reworked: it now works perfectly with `body` and `navigationElements`
- The `YPage` `onPageChanged` callback now triggers at the right moment.

**Breaking changes!**

- `YPage` has no `showScrollbar` attribute anymore
# 0.6.2 (03/01/2022)

- Add `onPageChanged` property to `YPage`

# 0.6.1 (30/12/2021)

Bug fixes:

- Incorrect context in `YPage`
- Incorrect `YAppBar` height without actions

# 0.6.0 (30/12/2021)

- Navigation components stable and documented. Check out the README to see available components and corresponding files for detailed documentation.

# 0.5.6 (27/12/2021)

- Bug fixes
- `YPage` api has been updated
- New: `YTabBar`, internally used in `YPage`

# 0.5.5 (05/11/2021)

- Bug fixes
- New: modal bottom sheets! use `YModalBottomSheets.show(...)`

# 0.5.4 (05/11/2021)

- The `YSnackbars` has been updated. `message` is now the only required parameter and a `hasIcon` parameter has been added
- New component: `YDropdownButton`

# 0.5.3 (04/11/2021)

- A new component has been released: `YRefreshIndicator`
- `YPage` now accepts an `onRefresh` argument, that adds a `YRefreshIndicator` to the page if not null
- Several bugs have been fixed for `YFormField`

# 0.5.2 (02/11/2021)

- Settings: add `enabled` and `disabledOnTap` properties to `YSettingsTile`

# 0.5.1 (24/10/2021)

- Fix documentation

## 0.5.0 (24/10/2021)

**Breaking changes!**

- All the components have been reworked
- `YShadowScrollContainer` is deprecated and will be removed in an upcoming version
- Documentation has been added and improved

## 0.4.3 (29/07/2021)

- Fix wrong variable name in `YCurrentTheme`: `buttonStyles` to `variableStyles`

## 0.4.2 (29/07/2021)

- Theme now generates a themeData that can be provided to `MaterialApp` for example

## 0.4.1 (28/07/2021)

- Fix documentation

## 0.4.0 (16/07/2021)

**Breaking changes!**

- Modifications applied to the themes: they now must be setup in the application (there were set in the package itself until this release)

## 0.3.2 (16/07/2021)

- Update YSwitch width
- Make themes list a public variable

## 0.3.1 (16/07/2021)

- remove default AlertDialog padding
- reduce YShadowScrollContainer gradient height

## 0.3.0 (15/07/2021)

**Breaking changes!**

- package renamed to `ynotes_packages`
- `currenTheme` renamed to `theme`
- add a lot of components
- remove sizer package
- add utilities
- split components and theme
