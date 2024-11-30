part of 'app_cubit.dart';

class AppState extends Equatable {
  final bool needReloadData;
  final bool isLoggedIn;
  final int totalProductFavorite;
  final bool hasUnReadNotify;
  final String appVersion;
  final UserInfoRes? userInfo;
  final bool isActive;
  final Location? currentLocation;
  final Location? destination;
  final Location? finalDestination;
  final String destinationAdress;
  final String finalDestinationAdress;
  final BitmapDescriptor? currentLocationIcon;
  final AppStatus appStatus;
  final Set<Polyline> polyline;

  const AppState({
    this.needReloadData = false,
    this.isLoggedIn = false,
    this.totalProductFavorite = 0,
    this.hasUnReadNotify = false,
    this.appVersion = '',
    this.userInfo,
    this.isActive = false,
    this.currentLocation,
    this.currentLocationIcon,
    this.appStatus = AppStatus.free,
    this.polyline = const {},
    this.destination,
    this.destinationAdress = '',
    this.finalDestinationAdress = '',
    this.finalDestination
  });

  @override
  List<Object?> get props => [
        needReloadData,
        isLoggedIn,
        totalProductFavorite,
        hasUnReadNotify,
        appVersion,
    userInfo,
    isActive,
    currentLocation,
    currentLocationIcon,
    appStatus,
    polyline,
    destination,
    destinationAdress,
    finalDestinationAdress,
    finalDestination
      ];

  AppState copyWith({
    bool? needReloadData,
    bool? isLoggedIn,
    int? totalProductFavorite,
    bool? hasUnReadNotify,
    String? appVersion,
    UserInfoRes? userInfo,
    bool? isActive,
    Location? currentLocation,
    BitmapDescriptor? currentLocationIcon,
    Timer? timer,
    AppStatus? appStatus,
    Set<Polyline>? polyline,
    Location? destination,
    Location? finalDestination,
    String? destinationAdress,
    String? finalDestinationAdress,
  }) {
    return AppState(
      needReloadData: needReloadData ?? this.needReloadData,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      totalProductFavorite: totalProductFavorite ?? this.totalProductFavorite,
      hasUnReadNotify: hasUnReadNotify ?? this.hasUnReadNotify,
      appVersion: appVersion ?? this.appVersion,
      userInfo: userInfo ?? this.userInfo,
      isActive: isActive ?? this.isActive,
      currentLocation: currentLocation ?? this.currentLocation,
      currentLocationIcon: currentLocationIcon ?? this.currentLocationIcon,
      appStatus: appStatus  ?? this.appStatus,
      polyline: polyline ?? this.polyline,
      destination: destination ?? this.destination,
        destinationAdress: destinationAdress ?? this.destinationAdress,
        finalDestination: finalDestination ?? this.finalDestination,
        finalDestinationAdress: finalDestinationAdress ?? this.finalDestinationAdress
    );
  }
}
