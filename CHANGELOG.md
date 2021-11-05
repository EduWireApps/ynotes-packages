# 0.5.4 (05/11/2021)

- The `YSnackbars` has been updated. `message` is now the only required parameter and a `hasIcon` parameter has been added

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
