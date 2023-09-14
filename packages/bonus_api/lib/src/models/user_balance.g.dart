// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBalanceModel _$UserBalanceModelFromJson(Map<String, dynamic> json) =>
    UserBalanceModel(
      balance: json['balance'] as int,
      todayChanges: json['todayChanges'] as int,
    );

Map<String, dynamic> _$UserBalanceModelToJson(UserBalanceModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'todayChanges': instance.todayChanges,
    };
