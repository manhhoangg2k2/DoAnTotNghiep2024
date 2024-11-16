// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRes _$LoginResFromJson(Map<String, dynamic> json) => LoginRes(
      phoneNumber: json['phoneNumber'] as String?,
      token: json['token'] as String?,
      expired: json['expired'] as String?,
    );

Map<String, dynamic> _$LoginResToJson(LoginRes instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'token': instance.token,
      'expired': instance.expired,
    };
