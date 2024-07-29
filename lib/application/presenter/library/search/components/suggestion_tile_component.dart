part of '../search_handler.dart';

class _Suggestion extends StatelessWidget {

  const _Suggestion({
    required this.game,
    required this.controller,
  });

  final Game game;
  final _Controller controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.push('/details/${game.title}').then((value) {
          FocusManager.instance.primaryFocus?.unfocus();
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget> [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Material(
                color: Palette.transparent.color,
                surfaceTintColor: Palette.transparent.color,
                child: Text(
                  game.title.replaceAll(' - ', ': '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Typographies.body(Palette.elements).style,
                ),
              ),
            ),
          ),
          SizedBox.square(
            dimension: 40,
            child: Icon(
              Icons.history_rounded,
              color: Palette.elements.color,
            ),
          ),
        ],
      ),
    );
  }
}