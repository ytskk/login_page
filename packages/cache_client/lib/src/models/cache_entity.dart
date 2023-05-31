/// {@template cache_entity}
/// Holds [value] and [updatedAt] timestamp.
///
/// If [updatedAt] is not provided, it defaults to [DateTime.now()].
/// {@endtemplate}
class CacheEntity<T extends Object> {
  /// {@macro cache_entity}
  const CacheEntity(
    T value, {
    this.updatedAt,
    this.isPersistent = true,
    this.cacheDuration,
  }) : _value = value;

  CacheEntity.dated(
    T value, {
    DateTime? updatedAt,
    this.cacheDuration = const Duration(seconds: 5),
  })  : _value = value,
        isPersistent = false,
        updatedAt = updatedAt ?? DateTime.now();

  factory CacheEntity.persistent(T value) => CacheEntity(value);

  final T _value;
  final DateTime? updatedAt;
  final Duration? cacheDuration;

  /// If [isPersistent] is `true`, the [_value] will be stored in the cache
  /// indefinitely and will ignore the [updatedAt] timestamp.
  final bool isPersistent;

  T? get value {
    if (isPersistent) return _value;

    if (cacheDuration != null) {
      final now = DateTime.now();
      final diff = now.difference(updatedAt!);
      if (diff < cacheDuration!) {
        return _value;
      }
    }

    return null;
  }
}
