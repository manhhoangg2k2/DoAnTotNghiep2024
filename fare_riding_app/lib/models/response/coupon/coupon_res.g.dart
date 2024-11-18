// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponRes _$CouponResFromJson(Map<String, dynamic> json) => CouponRes(
      coupons: (json['coupons'] as List<dynamic>)
          .map((e) => Coupon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CouponResToJson(CouponRes instance) => <String, dynamic>{
      'coupons': instance.coupons,
    };

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      discountAmount: json['discount_amount'] as String,
      customerId: (json['customer_id'] as num).toInt(),
      expiredDate: DateTime.parse(json['expired_date'] as String),
      minPriceValidated: json['min_price_validated'] as String,
      description: json['description'] as String,
      maxDiscount: json['max_discount'] as String,
      usageLimit: (json['usage_limit'] as num).toInt(),
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'discount_amount': instance.discountAmount,
      'customer_id': instance.customerId,
      'expired_date': instance.expiredDate.toIso8601String(),
      'min_price_validated': instance.minPriceValidated,
      'description': instance.description,
      'max_discount': instance.maxDiscount,
      'usage_limit': instance.usageLimit,
    };
