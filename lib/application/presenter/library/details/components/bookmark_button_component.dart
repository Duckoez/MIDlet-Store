part of '../details_handler.dart';

/// A [Widget] that creates a bookmark [Button].
class _Bookmark extends StatelessWidget {

  const _Bookmark({
    required this.controller,
  });

  /// The [Details] controller.
  /// 
  /// The controller that handles the state of the button.
  final _Controller controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, bool isFavorite, Widget? _) {
        late final IconData icon;
        if (isFavorite) {
          icon = Icons.bookmark_rounded;
        }
        else {
          icon = Icons.bookmark_border_rounded;
        }
        return Button(
          icon: icon,
          onTap: controller.toggleBookmarkStatus,
        );
      },
      valueListenable: controller.isFavorite,
    );
  }
}