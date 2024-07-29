part of '../buttons_factory.dart';

class _Button extends StatelessWidget {

  const _Button({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.transparent.color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Palette.transparent.color,
      ),
      height: 40,
      width: 40,
      child: Icon(
        icon,
        color: Palette.elements.color,
        size: 25,
      ),
    );
  }
}