// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_operations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOperationsResponseModel _$UserOperationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserOperationsResponseModel(
      operations: (_readFromData(json, 'items') as List<dynamic>)
          .map((e) => UserOperationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['userId'] as int,
      totalOperations: _readFromData(json, 'totalOperations') as int,
    );

Map<String, dynamic> _$UserOperationsResponseModelToJson(
        UserOperationsResponseModel instance) =>
    <String, dynamic>{
      'items': instance.operations,
      'userId': instance.userId,
      'totalOperations': instance.totalOperations,
    };
