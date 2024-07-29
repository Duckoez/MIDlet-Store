import '../interfaces/favorites_interface.dart';
import '../interfaces/games_interface.dart';
import '../interfaces/recents_interface.dart';

/// The database interface.
abstract class IDatabase {

  /// Initializes the database.
  ///
  /// This method should be called to set up the database before using it.
  Future<void> initialize();

  /// Gets the games repository.
  ///
  /// Provides access to the game library.
  IGames get games;

  /// Gets the favorites repository.
  ///
  /// Provides access to the collection of favorite games.
  IFavorites get favorites;

  /// Gets the recents repository.
  ///
  /// Provides access to the collection of recently accessed games.
  IRecents get recents;
}