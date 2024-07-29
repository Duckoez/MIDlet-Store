import '../../core/entities/game_entity.dart';

import '../interfaces/database_interface.dart';

/// The favorites repository interface.
///
/// This interface is used by the [IDatabase] interface to manage favorite games.
abstract class IFavorites {
  
  /// Retrieves all the user's favorite games.
  List<Game> all();

  /// Clears all favorite games.
  void clear();

  /// Closes the connection to the favorites table/collection.
  void close();

  /// Checks if the given [game] is in the favorites collection.
  bool contains(Game game);

  /// Removes the given [game] from the favorites collection.
  void delete(Game game);

  /// Retrieves a [Game] from the favorites collection by its [index].
  Game? fromIndex(int index);

  /// Gets the number of games in the favorites collection.
  int get length;

  /// Opens the connection to the favorites collection.
  void open();

  /// Adds the given [game] to the favorites collection.
  void put(Game game);
}