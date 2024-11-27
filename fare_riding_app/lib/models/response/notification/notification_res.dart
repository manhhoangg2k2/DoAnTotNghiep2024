import 'package:json_annotation/json_annotation.dart';

part 'notification_res.g.dart';

@JsonSerializable()
class NotificationRes {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "message")
  String? message;

  NotificationRes({
    required this.title,
    required this.message,
  });

  factory NotificationRes.fromJson(Map<String, dynamic> json) => _$NotificationResFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResToJson(this);
}