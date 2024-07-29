import '../../core/exceptions/exception_interface.dart';

class GameException extends IException {

  GameException({
    required super.message,
    super.stacktrace,
  });
}