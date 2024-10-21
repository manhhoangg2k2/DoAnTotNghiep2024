import 'package:json_annotation/json_annotation.dart';

part 'login_res.g.dart';

@JsonSerializable()
class LoginRes {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "access")
  Access? access;

  LoginRes({
    required this.code,
    required this.access,
  });

  factory LoginRes.fromJson(Map<String, dynamic> json) => _$LoginResFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResToJson(this);
}

@JsonSerializable()
class Access {
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "expires")
  DateTime expires;

  Access({
    required this.token,
    required this.expires,
  });

  factory Access.fromJson(Map<String, dynamic> json) => _$AccessFromJson(json);

  Map<String, dynamic> toJson() => _$AccessToJson(this);
}