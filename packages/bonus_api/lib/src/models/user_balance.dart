import 'package:json_annotation/json_annotation.dart';

part 'user_balance.g.dart';

@JsonSerializable()
class UserBalanceModel {
  const UserBalanceModel({
    required this.totalBalance,
    required this.todayChanges,
  });

  final int totalBalance;
  final int todayChanges;

  factory UserBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBalanceModelToJson(this);
}
