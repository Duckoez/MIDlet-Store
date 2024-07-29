/// Base interface for custom exceptions in the application.
///
/// This interface extends the standard [Exception] class and provides additional properties for error message and stack trace.
abstract class IException implements Exception {

  IException({
    required this.message,
    this.stacktrace,
  });

  /// A descriptive message that explains the nature of the exception.
  final String message;

  /// Optional stack trace information associated with the exception.
  final StackTrace? stacktrace;

  @override
  String toString() {
    return '\n  message: $message,\n  stacktrace: $stacktrace,\n';
  }
}