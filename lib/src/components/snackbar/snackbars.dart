part of components;

/// A class that makes using default snackbars easier.
class YSnackbars {
  YSnackbars._();

  /// Show a success snackbar.
  static void success(BuildContext context,
          {required String title, required String message, YSnackbarAction? action}) =>
      YSnackBar(context,
              title: title, message: message, icon: Icons.check_circle_rounded, color: YColor.success, action: action)
          .show();

  /// Show a warning snackbar.
  static void warning(BuildContext context,
          {required String title, required String message, YSnackbarAction? action}) =>
      YSnackBar(context,
              title: title, message: message, icon: Icons.warning_rounded, color: YColor.warning, action: action)
          .show();

  /// Show an error snackbar.
  static void error(BuildContext context, {required String title, required String message, YSnackbarAction? action}) =>
      YSnackBar(context,
              title: title, message: message, icon: Icons.error_rounded, color: YColor.danger, action: action)
          .show();
}
