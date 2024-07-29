import 'dart:io';

import 'package:flutter/services.dart';

/// The [Activity] class handles the Android channels and activities.
/// 
/// Implementation details can be found in [MainActivity.kt].
class Activity {

  /// The main Activity channel.
  static const MethodChannel _channel = MethodChannel("br.com.kidgbzin.midlet_store");

  /// The emulator activity.
  /// 
  /// Installs the MIDlet file on the emulator.
  /// 
  /// Exceptions to be handled:
  /// - `PlatformException`: Thrown by the [MethodChannel] when the emulator activity is not found or unavailable.
  static Future<void> emulator(File file) async {
    final Map<String, String> arguments = <String, String> {
      "Activity": "ru.playsoftware.j2meloader.MainActivity",
      "File-Path": file.path,
      "Package": "ru.playsoftware.j2meloader",
    };

    await _channel.invokeMethod('Install', arguments);
  }

  /// The GitHub activity.
  /// 
  /// Opens the GitHub repository of the emulator on the web browser.
  static Future<void> gitHub() async {
    final Map<String, String> arguments = <String, String> {
      "URL": "https://github.com/nikita36078/J2ME-Loader",
    };

    await _channel.invokeMethod('Launch URL', arguments);
  } 

  /// The Google Play activity.
  /// 
  /// Opens the PlayStore page of the emulator.
  static Future<void> playStore() async {
    final Map<String, String> arguments = <String, String> {
      "URL": "market://details?id=ru.playsoftware.j2meloader",
    };

    await _channel.invokeMethod('Launch URL', arguments);
  } 
}