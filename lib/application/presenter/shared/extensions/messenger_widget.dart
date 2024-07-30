import 'package:flutter/material.dart';

import '../../../core/enumerations/palette_enumeration.dart';

import '../widgets/section_widget.dart';

/// An extension on [SnackBar] for displaying event messages to the user.
class Messenger extends SnackBar {

  Messenger({
    required this.message,
    super.key,
  }) : super(
    content: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Palette.divider.color,
            width: 1,
          ),
          top: BorderSide(
            color: Palette.divider.color,
            width: 1,
          ),
        ),
      ),
      child: Section(
        title: 'Feedback',
        description: message,
      ),
    ),
    padding: const EdgeInsets.all(0),
  );
  
  /// The message to be shown.
  final String message;
}