import '../../core/entities/game_entity.dart';

import '../interfaces/database_interface.dart';

/// The recents repository interface.
///
/// This interface is used by the [IDatabase] interface to manage recently accessed games.
abstract class IRecents {

  /// Retrieves all recently accessed games in the collection.
  List<Game> all();

  /// Clears all games from the recents collection.
  void clear();

  /// Closes the connection to the recents collection.
  void close();

  /// Retrieves a recently accessed game by its index in the collection.
  Game? fromIndex(int index);

  /// Gets the number of recently accessed games in the collection.
  int get length;

  /// Opens the connection to the recents collection.
  void open();

  /// Adds a game to the recently accessed collection.
  void put(Game title);
}