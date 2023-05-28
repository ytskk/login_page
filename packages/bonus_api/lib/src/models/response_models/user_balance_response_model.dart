import 'package:bonus_api/bonus_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_balance_response_model.g.dart';

@JsonSerializable()
class UserBalanceResponseModel {
  const UserBalanceResponseModel({
    required this.data,
    required this.userId,
  });

  final UserBalanceModel data;
  final int userId;

  factory UserBalanceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBalanceResponseModelToJson(this);
}
