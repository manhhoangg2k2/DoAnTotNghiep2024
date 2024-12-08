// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRes _$TransactionResFromJson(Map<String, dynamic> json) =>
    TransactionRes(
      id: json['id'] as String,
      amount: json['amount'] as String,
      transactionType: json['transaction_type'] as String,
      timestamp: json['timestamp'] as String?,
      status: json['status'] as String,
      createdTime: json['created_time'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TransactionResToJson(TransactionRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'transaction_type': instance.transactionType,
      'timestamp': instance.timestamp,
      'status': instance.status,
      'created_time': instance.createdTime,
      'description': instance.description,
    };
