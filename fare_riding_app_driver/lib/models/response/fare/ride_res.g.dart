// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideRes _$RideResFromJson(Map<String, dynamic> json) => RideRes(
      id: json['id'] as String,
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RideResToJson(RideRes instance) => <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
    };
