import 'package:json_annotation/json_annotation.dart';

part 'login_res.g.dart';

@JsonSerializable()
class LoginRes {
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "expired")
  String? expired;

  LoginRes({
    required this.phoneNumber,
    required this.token,
    required this.expired,
  });

  factory LoginRes.fromJson(Map<String, dynamic> json) => _$LoginResFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResToJson(this);
}