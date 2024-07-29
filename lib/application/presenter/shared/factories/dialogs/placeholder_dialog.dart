part of '../dialogs_factory.dart';

/// Creates a [Dialog] content with a "Comming Soon" message.
class _Placeholder extends StatelessWidget {

  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return const Section(
      description: "This feature will become available in further updates.",
      title: 'Comming Soon',
    );
  }
}