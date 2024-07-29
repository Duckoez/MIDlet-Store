part of '../dialogs_factory.dart';

/// Creates a [Dialog] content with a loading animation.
class _Loader extends StatelessWidget {

  const _Loader();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        SizedBox.square(
          dimension: 25,
          child: CircularProgressIndicator(
            color: Palette.elements.color,
          ),
        ),
      ],
    );
  }
}