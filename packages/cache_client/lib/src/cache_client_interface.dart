/// {@template cache_client}
/// Provides key, value storage for caching data.
/// {@endtemplate}
abstract interface class ICacheClient {
  /// Writes the provide [key], [value] pair to the cache.
  Future<void> write<T extends Object>({required String key, required T value});

  /// Looks up the value for the provided [key].
  ///
  /// Defaults to `null` if no value exists for the provided key.
  Future<T?> read<T extends Object>({required String key});
}
