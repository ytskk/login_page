/// {@template cache_entity}
/// Holds [value] and [updatedAt] timestamp.
///
/// If [updatedAt] is not provided, it defaults to [DateTime.now()].
/// {@endtemplate}
class CacheEntity<T extends Object> {
  /// {@macro cache_entity}
  CacheEntity(
    this.value, {
    DateTime? timestamp,
  }) : updatedAt = timestamp ?? DateTime.now();

  final T value;
  final DateTime updatedAt;
}
