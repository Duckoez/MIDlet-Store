import 'package:flutter/material.dart';

import '../../../core/enumerations/palette_enumeration.dart';
import '../../../core/enumerations/progress_enumeration.dart';
import '../../../core/enumerations/typographies_enumeration.dart';

class Handler extends StatelessWidget {

  const Handler({
    required this.message,
    required this.progress,
    required this.child,
    super.key,
  });

  final ValueNotifier<String> message;

  final ValueNotifier<Progress> progress;

  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, Progress progress, Widget? _) {
        return _build(
          progress: progress,
          message: message,
        );
      },
      valueListenable: progress,
    );
  }

  Widget _build({
    required Progress progress,
    required ValueNotifier<String> message,
  }) {
    if (progress == Progress.loading) {
      return const _Loading();
    }
    else if (progress == Progress.finished) {
      return child;
    }
    else {
      return _Error(
        message: message,
      );
    }
  }
}

class _Loading extends StatelessWidget {

  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Palette.elements.color,
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {

  const _Error({
    required this.message,
  });

  final ValueNotifier<String> message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        builder: (context, value, child) {
          return Align(
            alignment: Alignment.center,
            child: Text(
              message.value,
              style: Typographies.body(Palette.elements).style,
              textAlign: TextAlign.center,
            ),
          );
        },
        valueListenable: message,
      ),
    );
  }
}