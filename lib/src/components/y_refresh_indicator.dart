part of components;

/// Creates a refresh indicator.
class YRefreshIndicator extends StatelessWidget {
  /// The widget's child. Must be scrollable to work.
  final Widget child;

  /// A function that's called when the user has dragged the refresh indicator far enough
  /// to demonstrate that they want the app to refresh. The returned [Future] must complete
  /// when the refresh operation is finished.
  final Future<void> Function() onRefresh;

  /// Creates a refresh indicator.
  const YRefreshIndicator({Key? key, required this.child, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: child,
      onRefresh: onRefresh,
      color: theme.colors.primary.backgroundColor,
      backgroundColor: theme.colors.backgroundLightColor,
    );
  }
}
