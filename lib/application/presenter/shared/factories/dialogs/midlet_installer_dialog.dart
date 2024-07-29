part of '../dialogs_factory.dart';

/// Creates a [Dialog] content that will install a MIDlet into the emulator.
class _MIDletInstaller extends StatefulWidget {

  const _MIDletInstaller({
    required this.installMIDlet,
  });

  /// The installer function.
  final Future<void> installMIDlet;

  @override
  State<_MIDletInstaller> createState() => _MIDletInstallerState();
}

class _MIDletInstallerState extends State<_MIDletInstaller> {
  late final ValueNotifier<Widget> child;

  @override
  void initState() {
    child = ValueNotifier(const _Loader());
    _tryInstall(child);

    super.initState();
  }

  @override
  void dispose() {
    child.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, Widget child, Widget? _) {
        return AnimatedSize(
          duration: Durations.medium2,
          child: AnimatedSwitcher(
            duration: Durations.medium2,
            child: child,
          ),
        );
      },
      valueListenable: child,
    );
  }

  /// Tries to install the MIDlet into the emulator.
  /// 
  /// When the installation is finished, opens the emulator activity.
  /// If the installer encounters a problem, it handles the error and shows a proper message to the user.
  Future<void> _tryInstall(ValueNotifier<Widget> child) async {
    const String label = 'Details | Component • Install Dialog';
    try {
      await widget.installMIDlet;

      if (mounted) {
        context.pop();
      }
    }
    on PlatformException catch (error) {
      Logger.error.print(
        message: '$error',
        label: label,
      );
      child.value = const _EmulatorError();
    }
    catch (error) {
      Logger.error.print(
        message: '$error',
        label: label,
      );
      child.value = _Error(
        message: '$error',
      );
    }
  }
}