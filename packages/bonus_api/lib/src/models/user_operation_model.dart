import 'package:json_annotation/json_annotation.dart';

part 'user_operation_model.g.dart';

@JsonSerializable()
class UserOperationModel {
  const UserOperationModel({
    required this.date,
    required this.description,
    required this.value,
  });

  final DateTime date;
  final String description;
  final int value;

  factory UserOperationModel.fromJson(Map<String, dynamic> json) =>
      _$UserOperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserOperationModelToJson(this);
}
