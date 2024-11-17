// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoRes _$UserInfoResFromJson(Map<String, dynamic> json) => UserInfoRes(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      gender: json['gender'] as String,
      passcode: json['passcode'] as String,
      balance: (json['balance'] as num).toDouble(),
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserInfoResToJson(UserInfoRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'passcode': instance.passcode,
      'balance': instance.balance,
      'email': instance.email,
    };
