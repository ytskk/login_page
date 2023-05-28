import 'package:bonus_api/bonus_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_operations_response_model.g.dart';

@JsonSerializable()
class UserOperationsResponseModel {
  const UserOperationsResponseModel({
    required this.operations,
    required this.userId,
    required this.totalOperations,
  });

  @JsonKey(
    name: 'items',
    readValue: _readFromData,
  )
  final List<UserOperationModel> operations;
  final int userId;

  @JsonKey(
    readValue: _readFromData,
  )
  final int totalOperations;

  factory UserOperationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserOperationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserOperationsResponseModelToJson(this);
}

Object? _readFromData(Map json, String value) {
  return json['data'][value];
}
