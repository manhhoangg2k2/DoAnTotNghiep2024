import 'package:json_annotation/json_annotation.dart';

part 'transaction_res.g.dart';

@JsonSerializable()
class TransactionRes {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "amount")
  final String amount;

  @JsonKey(name: "transaction_type")
  final String transactionType;

  @JsonKey(name: "timestamp")
  final String? timestamp;

  @JsonKey(name: "status")
  final String status;

  @JsonKey(name: "created_time")
  final String createdTime;

  @JsonKey(name: "description")
  final String description;

  TransactionRes({
    required this.id,
    required this.amount,
    required this.transactionType,
    this.timestamp,
    required this.status,
    required this.createdTime,
    required this.description,
  });

  factory TransactionRes.fromJson(Map<String, dynamic> json) => _$TransactionResFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResToJson(this);
}
