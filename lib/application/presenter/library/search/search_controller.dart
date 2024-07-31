part of '../search/search_handler.dart';

class _Controller {
  
  _Controller({
    required this.bucket,
    required this.database,
  });

  /// The bucket service for fetching and storing data.
  late final IBucket bucket;

  /// The database service for data operations.
  late final IDatabase database;

  /// Initializes the controller and fetches the necessary data using a game [title] as a key to display its data.
  /// 
  /// While the controller is fetching data, it updates the state of its [progress].
  final ValueNotifier<Progress> progress = ValueNotifier(Progress.loading);

  final TextEditingController textController = TextEditingController();

  late GlobalKey overlayKey;

  late final List<Game> _games; 
  
  late final ValueNotifier<List<Game>> games;

  late final ValueNotifier<List<Game>> suggestions;

  Future<void> initialize() async {
    try {
      _games = database.games.all();

      games = ValueNotifier(_games);
      suggestions = ValueNotifier(database.recents.all());
      progress.value = Progress.finished;
    }
    catch (error, stackTrace) {
      Logger.error.print(
        label: 'Search | Controller',
        message: '$error',
        stackTrace: stackTrace,
      );
      progress.value = Progress.error;
    }
  }

  /// Get a [Future] reference of a thumbnail from the [bucket].
  /// 
  /// This reference should be used on a [FutureBuilder].
  Future<File> getCover(String title) => bucket.cover(title);

  /// Filters a list of games based on a search query.
  /// 
  /// The search is performed by checking if the query appears in any of the following fields:
  /// - If the game's title contains [query].
  /// - If the game's description contains [query].
  /// - If the game's year of release is equal to [query].
  /// - If the game's vendor contains [query].
  /// - If any tag matches the [query].
  void applySearch(String query) {
    query = query.toLowerCase();
  
    games.value = _games.where((element) {
      final String title = element.title.toLowerCase();
      final String description = element.description!.toLowerCase();
      final String release = element.release.toString();
      final String vendor = element.vendor.toLowerCase();

      return title.contains(query) ||
             description.contains(query) ||
             release == query ||
             vendor.contains(query) ||
             element.tags.any((tag) => tag.toLowerCase() == query);
    }).toList();
  }

  void updateQuery(String query) {
    textController.text = query;
    applySearch(query);
  }
}