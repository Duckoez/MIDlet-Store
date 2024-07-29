import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';

import '../../core/entities/midlet_entity.dart';

import '../../external/interfaces/android_interface.dart';
import '../../external/interfaces/client_interface.dart';

import '../interfaces/bucket_interface.dart';

class Bucket implements IBucket {

  const Bucket({
    required this.android,
    required this.gitHub,
  });

  final IAndroid android;
  final IClient gitHub;
  
  @override
  Future<File> audio(String title) async {
    const String folder = 'Audios';
    final String document = '$title.rtx';
    File file = await android.read(
      folder: folder,
      document: document,
    );
    final bool exists = await file.exists();
    if (!exists) {
      final Uint8List bytes = await gitHub.get('$folder/$document');
      file = await android.write(
        bytes: bytes,
        document: document,
        folder: folder,
      );
    }
    return file;
  }

  @override
  Future<File> cover(String title) async {
    const String folder = 'Covers';
    final String document = '$title.png';
    File file = await android.read(
      folder: folder,
      document: document,
    );
    final bool exists = await file.exists();
    if (!exists) {
      final Uint8List bytes = await gitHub.get('$folder/$document');
      file = await android.write(
        bytes: bytes,
        document: document,
        folder: folder,
      );
    }
    return file;
  }

  @override
  Future<File> midlet(MIDlet midlet) async {
    final String folder = 'MIDlets/${midlet.title}';
    File file = await android.read(
      folder: folder,
      document: midlet.file,
    );
    final bool exists = await file.exists();
    if (!exists) {
      final Uint8List bytes = await gitHub.get('$folder/${midlet.file}');
      file = await android.write(
        bytes: bytes,
        document: midlet.file,
        folder: folder,
      );
    }
    return file;
  }

  @override
  Future<List<Uint8List>> previews(String title) async {
    const String folder = 'Previews';
    final String document = '$title.zip';
    File file = await android.read(
      folder: folder,
      document: document,
    );
    final bool exists = await file.exists();
    if (!exists) {
      final Uint8List bytes = await gitHub.get('$folder/$document');
      file = await android.write(
        bytes: bytes,
        document: document,
        folder: folder,
      );
    }
    return _extract(file);
  }

  /// Extract the .ZIP files.
  /// 
  /// Used on the [previews] function.
  List<Uint8List> _extract(File package) {
    final List<Uint8List> temporary = <Uint8List> [];
    final Uint8List bytes = package.readAsBytesSync();
    final Archive archive = ZipDecoder().decodeBytes(bytes);
    for (ArchiveFile index in archive) {
      temporary.add(index.content as Uint8List);
    }
    return temporary;
  }
}