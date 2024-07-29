part of '../dialogs_factory.dart';

/// Creates a [Dialog] content showing an error message.
class _Error extends StatelessWidget {

  const _Error({
    required this.message,
  });

  /// The error message to be shown to the user.
  final String message;

  @override
  Widget build(BuildContext context) {
    return Section(
      description: message,
      title: "Something Went Wrong",
    );
  }
}