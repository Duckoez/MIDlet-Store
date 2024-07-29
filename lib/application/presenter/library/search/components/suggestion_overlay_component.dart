part of '../search_handler.dart';

class _SuggestionOverlay extends StatefulWidget {

  const _SuggestionOverlay({
    required this.controller,
  });

  final _Controller controller;

  @override
  State<_SuggestionOverlay> createState() => _SuggestionOverlayState();
}

class _SuggestionOverlayState extends State<_SuggestionOverlay> with WidgetsBindingObserver {
  late final GlobalKey _key;

  @override
  void initState() {
    _key = GlobalKey();
    widget.controller.overlayKey = _key;
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 0,
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.5),
        color: Palette.foreground.color,
      ),
      key: _key,
      child: ValueListenableBuilder(
        valueListenable: widget.controller.suggestions,
        builder: (BuildContext context, List<Game> suggestions, Widget? _) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _Suggestion(
                controller: widget.controller,
                game: suggestions[index],
              );
            },
            itemCount: _itemCount(suggestions.length),
            reverse: true,
          );
        }
      ),
    );
  }

  int _itemCount(int length) {
    if (length > 9) {
      return 9;
    }
    return length;
  }
}