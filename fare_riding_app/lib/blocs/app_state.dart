part of 'app_cubit.dart';

class AppState extends Equatable {
  final bool needReloadData;
  final bool isLoggedIn;
  final int totalProductFavorite;
  final bool hasUnReadNotify;
  final String appVersion;
  final UserInfoRes? userInfo;
  final Set<Polyline> polyline;
  final Location? driverLocation;
  final double driverDuration;
  final BitmapDescriptor? currentLocationIcon;
  final AppStatus appStatus;

  const AppState(
      {this.needReloadData = false,
      this.isLoggedIn = false,
      this.totalProductFavorite = 0,
      this.hasUnReadNotify = false,
      this.appVersion = '',
      this.userInfo,
      this.polyline = const {},
      this.driverDuration = 0,
      this.driverLocation,
      this.currentLocationIcon,
      this.appStatus = AppStatus.free});

  @override
  List<Object?> get props => [
        needReloadData,
        isLoggedIn,
        totalProductFavorite,
        hasUnReadNotify,
        appVersion,
        userInfo,
        currentLocationIcon,
        polyline,
        driverDuration,
        driverLocation,
        appStatus
      ];

  AppState copyWith({
    bool? needReloadData,
    bool? isLoggedIn,
    int? totalProductFavorite,
    bool? hasUnReadNotify,
    String? appVersion,
    UserInfoRes? userInfo,
    Set<Polyline>? polyline,
    Location? driverLocation,
    double? driverDuration,
    BitmapDescriptor? currentLocationIcon,
    AppStatus? appStatus,
  }) {
    return AppState(
      needReloadData: needReloadData ?? this.needReloadData,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      totalProductFavorite: totalProductFavorite ?? this.totalProductFavorite,
      hasUnReadNotify: hasUnReadNotify ?? this.hasUnReadNotify,
      appVersion: appVersion ?? this.appVersion,
      userInfo: userInfo ?? this.userInfo,
      polyline: polyline ?? this.polyline,
      driverLocation: driverLocation ?? this.driverLocation,
      driverDuration: driverDuration ?? this.driverDuration,
      currentLocationIcon: currentLocationIcon ?? this.currentLocationIcon,
      appStatus: appStatus ?? this.appStatus,
    );
  }
}
