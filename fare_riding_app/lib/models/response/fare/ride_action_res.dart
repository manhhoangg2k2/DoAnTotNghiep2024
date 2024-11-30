import 'package:json_annotation/json_annotation.dart';

part 'ride_action_res.g.dart';

@JsonSerializable()
class RideActionRes {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'publisher')
  final String publisher;
  @JsonKey(name: 'action')
  final String action;


  RideActionRes({
    required this.id,
    required this.publisher,
    required this.action,
  });

  factory RideActionRes.fromJson(Map<String, dynamic> json) => _$RideActionResFromJson(json);

  Map<String, dynamic> toJson() => _$RideActionResToJson(this);
}
