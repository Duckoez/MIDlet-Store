import 'dart:typed_data';

/// The client service interface.
///
/// This interface defines a method for making HTTP or network requests.
abstract class IClient {
  
  /// Retrieves binary data from the specified [source].
  Future<Uint8List> get(String source);
}