// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBalanceResponseModel _$UserBalanceResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserBalanceResponseModel(
      data: UserBalanceModel.fromJson(json['data'] as Map<String, dynamic>),
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$UserBalanceResponseModelToJson(
        UserBalanceResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'userId': instance.userId,
    };
