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

  const AppState({
    this.needReloadData = false,
    this.isLoggedIn = false,
    this.totalProductFavorite = 0,
    this.hasUnReadNotify = false,
    this.appVersion = '',
    this.userInfo,
    this.isActive = false,
    this.currentLocation
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
  }) {
    return AppState(
      needReloadData: needReloadData ?? this.needReloadData,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      totalProductFavorite: totalProductFavorite ?? this.totalProductFavorite,
      hasUnReadNotify: hasUnReadNotify ?? this.hasUnReadNotify,
      appVersion: appVersion ?? this.appVersion,
      userInfo: userInfo ?? this.userInfo,
      isActive: isActive ?? this.isActive,
      currentLocation: currentLocation ?? this.currentLocation
    );
  }
}
