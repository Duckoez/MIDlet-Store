import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/entities/game_entity.dart';

import '../../external/interfaces/client_interface.dart';

import '../interfaces/database_interface.dart';
import '../interfaces/favorites_interface.dart';
import '../interfaces/games_interface.dart';
import '../interfaces/recents_interface.dart';

class Database implements IDatabase {

  Database({
    required this.favorites,
    required this.games,
    required this.gitHub,
    required this.recents,
  });

  final IClient gitHub;

  @override
  late final IFavorites favorites;

  @override
  late final IGames games;

  @override
  late final IRecents recents;

  @override
  Future<void> initialize() async {
    final Directory? directory = await getExternalStorageDirectory();

    Hive.defaultDirectory = directory!.path;

    Hive.registerAdapter('Game', Game.fromJson);

    favorites.open();
    games.open();
    recents.open();

    games.clear();
    recents.clear();
    favorites.clear();

    await _update();
  }

  /// Fetch the API database and update the local database with it.
  Future<void> _update() async {
    final Uint8List bytes = await gitHub.get('DATABASE.json');
    final List<dynamic> decoded = jsonDecode(utf8.decode(bytes));
    final List<Game> collection = decoded.map(Game.fromJson).toList();
  
    games.clear();
    for (final Game index in collection) {
      games.put(index);
    }
  }
}