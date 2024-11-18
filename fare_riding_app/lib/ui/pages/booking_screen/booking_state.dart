part of 'booking_cubit.dart';

@immutable
class BookingState {
  final CouponRes? listCoupon;
  final int couponChooseIndex;
  final RideEntity? rideEntity;

  const BookingState({
    this.listCoupon,
    this.couponChooseIndex = -1,
    this.rideEntity
  });

  BookingState copyWith({CouponRes? listCoupon, int? couponChooseIndex, RideEntity? rideEntity}) {
    return BookingState(
      listCoupon: listCoupon ?? this.listCoupon,
      couponChooseIndex: couponChooseIndex ?? this.couponChooseIndex,
      rideEntity: rideEntity ?? this.rideEntity

    );
  }
}

