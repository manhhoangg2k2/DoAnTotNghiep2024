part of 'booking_cubit.dart';

@immutable
class BookingState {
  final CouponRes? listCoupon;
  final int couponChooseIndex;
  final RideEntity? rideEntity;
  final int routeIndex;
  final int paymentMethodIndex;
  final Set<Polyline>? polyline;

  const BookingState({
    this.listCoupon,
    this.couponChooseIndex = -1,
    this.rideEntity,
    this.routeIndex = 0,
    this.polyline,
    this.paymentMethodIndex = 0,
  });

  BookingState copyWith({CouponRes? listCoupon, int? couponChooseIndex, RideEntity? rideEntity,int? routeIndex, Set<Polyline>? polyline, int? paymentMethodIndex}) {
    return BookingState(
      listCoupon: listCoupon ?? this.listCoupon,
      couponChooseIndex: couponChooseIndex ?? this.couponChooseIndex,
      rideEntity: rideEntity ?? this.rideEntity,
      routeIndex: routeIndex ?? this.routeIndex,
      polyline: polyline ?? this.polyline,
      paymentMethodIndex: paymentMethodIndex ?? this.paymentMethodIndex
    );
  }
}

