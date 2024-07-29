import 'package:flutter/material.dart';

import '../../../core/enumerations/palette_enumeration.dart';
import '../../../core/enumerations/typographies_enumeration.dart';

part '../factories/buttons/default_button.dart';
part '../factories/buttons/named_button.dart';

/// A factory for creating [Widget] buttons.
class Button extends StatelessWidget {

  const Button._({
    required this.child,
    required this.onTap,
  });

  /// Callback function to be called when the button is tapped.
  final void Function() onTap;

  /// The widget representing the button's appearance.
  final Widget child;

  /// Creates a square [Button].
  factory Button({
    required IconData icon,
    required void Function() onTap,
  }) {
    return Button._(
      onTap: onTap,
      child: _Button(
        icon: icon,
      ),
    );
  }

  /// Creates a [Button] with a leading text.
  factory Button.withTitle({
    required IconData icon,
    required void Function() onTap,
    required String title,
    double? width,
    bool filled = false,
  }) {
    return Button._(
      onTap: onTap,
      child: _NamedButton(
        filled: filled,
        icon: icon,
        title: title,
        width: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}