part of components;

/// The class that handles bottom sheet.
class YModalBottomSheets {
  /// The class that handles bottom sheet.
  const YModalBottomSheets._();

  /// Shows a simple bottom sheet.
  static Future<T?> show<T>({required BuildContext context, required Widget child}) async {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return await showModalBottomSheet<T>(
      constraints: BoxConstraints(maxHeight: mediaQuery.size.height - min(mediaQuery.padding.top * 2, YScale.s10)),
      context: context,
      isScrollControlled: true,
      builder: (context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.colors.backgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(YScale.s4)),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    YVerticalSpacer(YScale.s3),
                    Container(
                        decoration:
                            BoxDecoration(color: theme.colors.backgroundLightColor, borderRadius: YBorderRadius.full),
                        width: YScale.s24,
                        height: YScale.s1p5),
                    YVerticalSpacer(YScale.s3),
                  ],
                ),
              ),
              Flexible(child: SingleChildScrollView(child: child))
            ],
          ),
        ),
      ),
      barrierColor: _barrierColor,
      backgroundColor: theme.colors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(YScale.s4)),
      ),
    );
  }
}
