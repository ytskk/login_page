class BalanceModel {
  const BalanceModel({
    required this.totalBalance,
    required this.todayChanges,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      totalBalance: json['totalBalance'] as int,
      todayChanges: json['todayChanges'] as int,
    );
  }

  final int totalBalance;
  final int todayChanges;

  Map<String, dynamic> toJson() {
    return {
      'totalBalance': totalBalance,
      'todayChanges': todayChanges,
    };
  }

  @override
  String toString() {
    return 'BalanceModel{totalBalance: $totalBalance, todayChanges: $todayChanges}';
  }
}
