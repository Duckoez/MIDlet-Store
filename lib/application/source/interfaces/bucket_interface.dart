import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../../core/entities/game_entity.dart';
import '../../core/entities/midlet_entity.dart';

/// The bucket service interface.
///
/// This interface defines methods for retrieving various assets related to a [Game].
abstract class IBucket {

  /// Retrieves the audio file associated with the given game title.
  Future<File> audio(String title);

  /// Retrieves the cover image associated with the given game title.
  Future<File> cover(String title);

  /// Retrieves the .JAR file for the given MIDlet.
  Future<File> midlet(MIDlet midlet);

  /// Retrieves a list of preview images associated with the given game title.
  Future<List<Uint8List>> previews(String title);
}