part of '../buttons_factory.dart';

class _NamedButton extends StatelessWidget {

  const _NamedButton({
    this.filled = false,
    required this.icon,
    required this.title,
    this.width,
  });

  final IconData icon;

  final String title;

  final double? width;

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 45,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: filled == false ? Palette.divider.color : Palette.primary.color.withOpacity(0.33),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        color: filled == false ? Palette.transparent.color : Palette.primary.color.withOpacity(0.10),
      ),
      padding: const EdgeInsets.fromLTRB(7.5, 0, 15, 0),
      height: 45,
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                title,
                style: Typographies.button(filled == false ? Palette.elements : Palette.accent).style,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Icon(
            icon,
            color: (filled == false ? Palette.elements : Palette.accent).color,
            size: 25,
          ),
        ],
      ),
    );
  }
}