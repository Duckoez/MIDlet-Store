import 'package:flutter/material.dart';

import '../../../core/enumerations/palette_enumeration.dart';

/// Creates a [Widget] that displays rating stars based on the game's rating score.
class Rating extends StatelessWidget {
  
  const Rating({
    required this.rating,
    super.key,
  });

  /// The game's rating score.
  ///
  /// This score determines the number of filled stars displayed.
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: _createRating(),
    );
  }

  /// Creates and returns a list of star widgets based on the rating score.
  List<Widget> _createRating() {
    final List<Widget> temporary = <Widget> [];

    for (int index = 0; index < 5; index++) {
      if (index < rating.round()) {
        temporary.add(_Star.filled());
      }
      else {
        temporary.add(_Star.empty());
      }
    }
    return temporary;
  }
}

/// A widget representing a star icon, either empty or filled.
class _Star extends StatelessWidget {

  /// Creates an empty star widget with default grey color and border icon.
  _Star.empty() : 
    color = Palette.grey.color,
    icon = Icons.star_border_rounded;

  /// Creates a filled star widget with gold color and filled star icon.
  _Star.filled() : 
    color = Palette.gold.color,
    icon = Icons.star_rounded;

  /// The color of the star icon.
  final Color color;

  /// The icon data representing the star.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
     return Icon(
      icon,
      color: color,
      size: 14,
    );
  }
}