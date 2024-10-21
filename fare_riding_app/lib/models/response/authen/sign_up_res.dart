import 'package:json_annotation/json_annotation.dart';

part 'sign_up_res.g.dart';
@JsonSerializable()
class SignUpRes {
  @JsonKey(name: "phoneNumber")
  String phoneNumber;

  SignUpRes({
    required this.phoneNumber,
  });

  factory SignUpRes.fromJson(Map<String, dynamic> json) => _$SignUpResFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResToJson(this);
}
