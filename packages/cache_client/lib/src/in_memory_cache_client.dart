import 'package:cache_client/cache_client.dart';

/// {@template in_memory_cache_client}
/// In memory cache client. Uses [Map] to store data.
///
/// Example:
/// ```dart
/// final ICacheClient cacheClient = InMemoryCacheClient();
/// cacheClient.write('key', 'value');
/// final value = await cacheClient.read<String>('key');
/// print(value); // value
/// ```
/// {@endtemplate}
final class InMemoryCacheClient implements ICacheClient {
  InMemoryCacheClient() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  @override
  Future<void> write<T extends Object>({
    required String key,
    required T value,
  }) async {
    _cache[key] = value;
  }

  @override
  Future<T?> read<T extends Object>({
    required String key,
  }) async {
    final value = _cache[key];

    if (value is CacheEntity) {
      return value.value as T?;
    }

    if (value is T) return value;

    return null;
  }
}
