class BonusesApiException implements Exception {
  const BonusesApiException({
    this.message,
    this.code,
  });

  final String? message;
  final int? code;

  @override
  String toString() =>
      'BonusesApiException: $message${code != null ? ' ($code)' : ''}';
}
