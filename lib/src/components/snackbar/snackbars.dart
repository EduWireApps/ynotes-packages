part of components;

/// A class that makes using default snackbars easier.
class YSnackbars {
  YSnackbars._();

  /// Shows a success snackbar.
  static void success(BuildContext context,
          {String? title, required String message, YSnackbarAction? action, bool hasIcon = true}) =>
      YSnackBar(context,
              title: title,
              message: message,
              icon: hasIcon ? Icons.check_circle_rounded : null,
              color: YColor.success,
              action: action)
          .show();

  /// Shows a warning snackbar.
  static void warning(BuildContext context,
          {String? title, required String message, YSnackbarAction? action, bool hasIcon = true}) =>
      YSnackBar(context,
              title: title,
              message: message,
              icon: hasIcon ? Icons.warning_rounded : null,
              color: YColor.warning,
              action: action)
          .show();

  /// Shows an error snackbar.
  static void error(BuildContext context,
          {String? title, required String message, YSnackbarAction? action, bool hasIcon = true}) =>
      YSnackBar(context,
              title: title,
              message: message,
              icon: hasIcon ? Icons.error_rounded : null,
              color: YColor.danger,
              action: action)
          .show();

  /// Shows an info snackbar.
  static void info(BuildContext context,
          {String? title, required String message, YSnackbarAction? action, bool hasIcon = true}) =>
      YSnackBar(context,
              title: title,
              message: message,
              icon: hasIcon ? Icons.info_rounded : null,
              color: YColor.info,
              action: action)
          .show();
}
