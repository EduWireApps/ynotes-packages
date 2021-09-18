part of components;

// TODO: documentation
class YFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final YColor color;

  const YFloatingButton({Key? key, required this.icon, required this.onPressed, this.color = YColor.primary})
      : super(key: key);

  YTColor get style => theme.colors.get(color);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 1,
      child: Icon(icon),
      onPressed: onPressed,
      backgroundColor: style.backgroundColor,
      foregroundColor: style.foregroundColor,
    );
  }
}
