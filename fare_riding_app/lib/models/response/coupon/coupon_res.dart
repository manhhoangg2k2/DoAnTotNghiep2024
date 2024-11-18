import 'package:json_annotation/json_annotation.dart';

part 'coupon_res.g.dart';

@JsonSerializable()
class CouponRes {
  final List<Coupon> coupons;

  CouponRes({
    required this.coupons,
  });

  factory CouponRes.fromJson(Map<String, dynamic> json) => _$CouponResFromJson(json);

  Map<String, dynamic> toJson() => _$CouponResToJson(this);
}

@JsonSerializable()
class Coupon {
  final int id;
  final String code;
  @JsonKey(name: 'discount_amount')
  final String discountAmount;
  @JsonKey(name: 'customer_id')
  final int customerId;
  @JsonKey(name: 'expired_date')
  final DateTime expiredDate;
  @JsonKey(name: 'min_price_validated')
  final String minPriceValidated;
  final String description;
  @JsonKey(name: 'max_discount')
  final String maxDiscount;
  @JsonKey(name: 'usage_limit')
  final int usageLimit;

  Coupon({
    required this.id,
    required this.code,
    required this.discountAmount,
    required this.customerId,
    required this.expiredDate,
    required this.minPriceValidated,
    required this.description,
    required this.maxDiscount,
    required this.usageLimit,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);
}

class CouponEntity {
  final int id;
  final String code;
  final String discountAmount;
  final int customerId;
  final DateTime expiredDate;
  final String minPriceValidated;
  final String description;
  final String maxDiscount;
  final int usageLimit;

  CouponEntity({
    required this.id,
    required this.code,
    required this.discountAmount,
    required this.customerId,
    required this.expiredDate,
    required this.minPriceValidated,
    required this.description,
    required this.maxDiscount,
    required this.usageLimit,
  });
}
