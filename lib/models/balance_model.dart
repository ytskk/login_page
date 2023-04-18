class BalanceModel {
  const BalanceModel({
    required this.totalBalance,
    required this.todayChanges,
  });

  final int totalBalance;
  final int todayChanges;

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      totalBalance: json['totalBalance'],
      todayChanges: json['todayChanges'],
    );
  }

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
