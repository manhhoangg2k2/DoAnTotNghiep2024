// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRes _$LoginResFromJson(Map<String, dynamic> json) => LoginRes(
      code: (json['code'] as num).toInt(),
      access: json['access'] == null
          ? null
          : Access.fromJson(json['access'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$LoginResToJson(LoginRes instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'access': instance.access,
    };

Access _$AccessFromJson(Map<String, dynamic> json) => Access(
      token: json['token'] as String,
      expires: DateTime.parse(json['expires'] as String),
    );

Map<String, dynamic> _$AccessToJson(Access instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires.toIso8601String(),
    };
