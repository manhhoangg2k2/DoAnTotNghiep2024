import 'package:json_annotation/json_annotation.dart';

part 'user_info_res.g.dart';

@JsonSerializable()
class UserInfoRes {
  final int id;
  final String name;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String gender;
  final String passcode;
  final double balance;
  final String email;

  UserInfoRes({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.passcode,
    required this.balance,
    required this.email,
  });

  factory UserInfoRes.fromJson(Map<String, dynamic> json) => _$UserInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResToJson(this);
}

extension UserInfoResEx on UserInfoRes {
  UserInfoEntity get convertToEntity {
    return UserInfoEntity(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      gender: gender,
      passcode: passcode,
      balance: balance,
      email: email,
    );
  }
}

class UserInfoEntity {
  final int id;
  final String name;
  final String phoneNumber;
  final String gender;
  final String passcode;
  final double balance;
  final String email;

  UserInfoEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.passcode,
    required this.balance,
    required this.email,
  });
}
