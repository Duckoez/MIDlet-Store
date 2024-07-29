part of '../details_handler.dart';

/// Creates a [Widget] that shows the game description section.
class _About extends StatelessWidget {

  const _About({
    required this.description,
  });

  /// The game's description.
  ///
  /// A brief information about the game.
  final String description;

  @override
  Widget build(BuildContext context) {
    return Section(
      description: description,
      title: 'About',
    );
  }
}