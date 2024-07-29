import 'package:hive/hive.dart';

import '../../core/entities/game_entity.dart';
import '../interfaces/recents_interface.dart';

class Recents implements IRecents {

  late final Box<Game> _box;

  @override
  int get length => _box.length;

  @override
  void put(Game game) {
    if (_box.containsKey(game.title)) {
      _box.delete(game.title);
    }
    _box.put(game.title, game);
    if (_box.length == 10) {
      _box.deleteAt(0);
    }
  } 
  
  @override
  void close() => _box.close();
  
  @override
  void open() {
    _box = Hive.box<Game>(
      maxSizeMiB: 1,
      name: 'RECENTS',
    );
  }

  @override
  void clear() => _box.clear();
  
  @override
  Game? fromIndex(int index) => _box[index];

  @override
  List<Game> all() {
    final List<Game> temporary = <Game> [];
    for (int index = 0; index < _box.length; index++) {
      temporary.add(_box[index]!);
    }
    return temporary;
  }
}