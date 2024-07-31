part of '../details_handler.dart';

/// Creates a [Widget] that shows a section of the game previews.
class _Preview extends StatefulWidget {

  const _Preview({
    required this.controller,
  });

  /// The [Details] controller.
  /// 
  /// The controller that handles the state of the previews.
  final _Controller controller;

  @override
  State<_Preview> createState() => _PreviewState();
}

class _PreviewState extends State<_Preview> {

  @override
  Widget build(BuildContext context) {
    return Section(
      description: 'The game\'s characteristics and previews may vary according to the model of your phone.',
      title: 'Previews',
      child: Container(
        height: (MediaQuery.of(context).size.width - 60) / 3 / 0.75,
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        width: double.infinity,
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<List<Uint8List>> snapshot) {
            if (snapshot.hasData) {
              final List<Uint8List> previews = snapshot.data!;
              return _previews(previews);
            }
            else if (snapshot.hasError) {
              if (snapshot.error is ResponseException) {
                final ResponseException exception = snapshot.error as ResponseException;
                Logger.error.print(
                  label: 'Details | Component • Previews Section',
                  message: exception.message,
                );
              }
              return Icon(
                Icons.broken_image_rounded,
                color: Palette.grey.color,
              );
            }
            else {
              return Icon(
                Icons.downloading_rounded,
                color: Palette.elements.color,
              );
            }
          },
          future: widget.controller.previews,
        ),
      ),
    );
  }

  Widget _previews(List<Uint8List> previews) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget> [
        _dialog(
          index: 0,
          previews: previews,
        ),
        _dialog(
          index: 1,
          previews: previews,
        ),
        _dialog(
          index: 2,
          previews: previews,
        ),
      ],
    );
  }

  Widget _dialog({
    required int index,
    required List<Uint8List> previews,
  }) {
    return Thumbnail(
      image: MemoryImage(previews[index]),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialogs.previews(
              initialPage: index,
              previews: previews,
            );
          },
        );
      },
    );
  }
}