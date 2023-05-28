// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOperationModel _$UserOperationModelFromJson(Map<String, dynamic> json) =>
    UserOperationModel(
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$UserOperationModelToJson(UserOperationModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'value': instance.value,
    };
