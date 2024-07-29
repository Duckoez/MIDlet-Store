import 'dart:io';
import 'dart:typed_data';

import '../../source/interfaces/bucket_interface.dart';

/// The Android service.
///
/// This interface used by [IBucket] interface defines methods for reading from and writing to the Android file system.
abstract class IAndroid {

  /// Reads a file from the specified folder.
  Future<File> read({
    required String document,
    required String folder,
  });

  /// Writes a file to the specified folder.
  Future<File> write({
    required Uint8List bytes,
    required String document,
    required String folder,
  });
}