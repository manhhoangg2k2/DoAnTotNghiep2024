// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_history_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideHistoryRes _$RideHistoryResFromJson(Map<String, dynamic> json) =>
    RideHistoryRes(
      id: json['id'] as String,
      driverId: (json['driver_id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      pickupLocation: json['pickup_location'] as String?,
      dropoffLocation: json['dropoff_location'] as String?,
      pickupTime: json['pickup_time'] as String?,
      dropoffTime: json['dropoff_time'] as String?,
      status: json['status'] as String,
      fare: json['fare'] as String,
      note: json['note'] as String?,
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RideHistoryResToJson(RideHistoryRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'customer_id': instance.customerId,
      'pickup_location': instance.pickupLocation,
      'dropoff_location': instance.dropoffLocation,
      'pickup_time': instance.pickupTime,
      'dropoff_time': instance.dropoffTime,
      'status': instance.status,
      'fare': instance.fare,
      'note': instance.note,
      'customer': instance.customer,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      gender: json['gender'] as String,
      passcode: json['passcode'] as String,
      balance: json['balance'] as String,
      createdDate: json['createddate'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'passcode': instance.passcode,
      'balance': instance.balance,
      'createddate': instance.createdDate,
      'email': instance.email,
    };
