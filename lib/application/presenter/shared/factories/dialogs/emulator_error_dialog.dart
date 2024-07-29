part of '../dialogs_factory.dart';

/// Creates a [Dialog] content showing an "Emulator Not Found" error and the instructions to install one.
class _EmulatorError extends StatelessWidget {

  const _EmulatorError();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        const Section(
          description: "There is no emulator available to launch on your device. Please make sure that your device has an emulator installed.",
          title: 'Something Went Wrong',
        ),
        Divider(
          color: Palette.divider.color,
          height: 1,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 22.5, 15, 15),
          child: Text(
            "You can also install the J2ME Loader emulator from one of the options below.",
            style: Typographies.body(Palette.grey).style,
          ),
        ),
        GestureDetector(
          onTap: Activity.playStore,
          child: Container(
            height: 45,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Image.asset(
              'assets/badges/PlayStore.png',
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        GestureDetector(
          onTap: Activity.gitHub,
          child: Container(
            height: 45,
            margin: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/badges/GitHub.png',
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
          child: Text(
            "When there is an emulator installed, it will start automatically next time.",
            style: Typographies.body(Palette.grey).style,
          ),
        ),
      ],
    );
  }
}