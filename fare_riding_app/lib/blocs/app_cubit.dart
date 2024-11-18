import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fare_riding_app/models/response/user/user_info_res.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../di/app_module.dart';
import '../repository/auth_repository.dart';
import '../repository/main_repository.dart';
import '../router/route_config.dart';
import '../ui/common/app_colors.dart';
import '../utlis/logger.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthRepository authRepo = getIt.get<AuthRepository>();
  final MainRepository mainRepo = getIt.get<MainRepository>();
  FirebaseMessaging? _messaging;
  // final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
  String fcmToken = '';

  AppCubit() : super(const AppState());

  bool isStoreReview = true;

  init() {
    // _setupFirebase();
    // checkNotificationUnRead();
    // getAppVersion();
  }

  // int get exchangeRateJPToVND =>
  //     state.listCurrencyExchangeRes
  //         .firstWhereOrNull((element) => element.currencyCode == "JPY")
  //         ?.transfer ??
  //     0;

//   Future<void> getAppVersion() async{
//     try {
//       PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       emit(state.copyWith(
//         appVersion: packageInfo.version.toString()
//       ));
//     } catch(e){
//       print(e);
//     }
// }

  // Future<void> uploadAvatar({
  //   required File file,
  // }) async {
  //   try {
  //     await mainRepo.uploadFile(
  //       file: file,
  //       type: 'avatar',
  //     );
  //     getUserInfo();
  //   } catch (e) {
  //     logger.e(e);
  //   }
  // }

  void setLoggedIn(bool isLoggedIn) {
    emit(state.copyWith(isLoggedIn: isLoggedIn));
  }


  /// Call when login success
  getUserSession() async {
    await getUserInfo();
  }

  getUserInfo() async {
    if (!state.isLoggedIn) return;
    try {
      final result = await mainRepo.getUserInfo();
      if (result.code == 200) {
        emit(state.copyWith(userInfo: result.data));
      }
      else{
        Get.offAllNamed(RouteConfig.signIn);
      }
    } catch (error) {
      Get.offAllNamed(RouteConfig.signIn);
      logger.e(error);
    }
  }

  void reloadData() {
    emit(state.copyWith(needReloadData: true));
  }

  // logout() async {
  //   try {
  //     await authRepo.deleteFcmToken(fcmToken: fcmToken);
  //   } catch (_) {}
  //   authRepo.removeToken();
  //   emit(state.removeUser());
  //   checkNotificationUnRead();
  // }

  // Future<void> _setupFirebase() async {
  //   _messaging = FirebaseMessaging.instance;
  //
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@drawable/ic_notification');
  //   var initializationSettingsIOS = const DarwinInitializationSettings();
  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //           android: initializationSettingsAndroid,
  //           iOS: initializationSettingsIOS);
  //   flutterLocalNotificationPlugin.initialize(initializationSettings,
  //       onDidReceiveNotificationResponse: _onDidReceiveLocalNotification);
  //   _firebaseCloudMessengerListener();
  // }

  // void _firebaseCloudMessengerListener() async {
  //   await _messaging!.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: false,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );
  //
  //   await _messaging!.getToken().then((value) {
  //     print('FCM token : $value');
  //     fcmToken = value ?? '';
  //   });
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  //
  //   FirebaseMessaging.onMessage.listen((message) {
  //     print('onMessage');
  //     _showNotification(message);
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //     NotificationRes notificationRes = NotificationRes.fromJson(event.data);
  //     handleTapNotification(notificationRes);
  //   });
  // }
  //
  // void _showNotification(RemoteMessage message) async {
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if (notification != null && android != null && !kIsWeb) {
  //     var androidChannel = const AndroidNotificationDetails(
  //         'com.click247.click247app', 'High Importance Notifications',
  //         ongoing: false,
  //         importance: Importance.max,
  //         playSound: true,
  //         priority: Priority.max);
  //     var platForm = NotificationDetails(android: androidChannel);
  //     await flutterLocalNotificationPlugin.show(notification.hashCode,
  //         notification.title, notification.body, platForm,
  //         payload: jsonEncode(message.data));
  //   }
  // }
  //
  // Future _onDidReceiveLocalNotification(NotificationResponse details) async {
  //   if (details.payload != null) {
  //     NotificationRes notificationRes =
  //         NotificationRes.fromJson(json.decode(details.payload!));
  //     handleTapNotification(notificationRes);
  //   }
  // }
  //
  // void handleTapNotification(NotificationRes notificationRes) {
  //   makeReadNotification(notificationRes.notifyId);
  //   handleNavigate(notificationRes);
  // }
  //
  // Future<void> makeReadNotification(String? notifyId) async {
  //   await mainRepo.makeReadNotification(id: notifyId);
  //   checkNotificationUnRead();
  // }

  // Future<void> handleNavigate(NotificationRes notificationRes) async {
  //   switch (notificationRes.notificationType) {
  //     case null:
  //       break;
  //     case NotificationType.listFeedBacks:
  //       if (state.isLoggedIn) {
  //         if (Get.currentRoute == RouteConfig.feedbackComplaint) {
  //           Get.offAndToNamed(RouteConfig.feedbackComplaint,
  //               arguments: FeedbackComplaintArg(
  //                   feedbackIndex:
  //                       int.tryParse(notificationRes.data ?? '') ?? 0));
  //         } else {
  //           Get.toNamed(RouteConfig.feedbackComplaint,
  //               arguments: FeedbackComplaintArg(
  //                   feedbackIndex:
  //                       int.tryParse(notificationRes.data ?? '') ?? 0));
  //         }
  //       }
  //       break;
  //     case NotificationType.feedbackDetail:
  //       if (!state.isLoggedIn) return;
  //       try {
  //         AppLoading.show();
  //         final rs = await mainRepo.getDetailFeedback(
  //             idFeedback: notificationRes.data ?? '');
  //         if (rs.isSuccess && rs.data != null) {
  //           if (Get.currentRoute == RouteConfig.comment) {
  //             Get.offAndToNamed(RouteConfig.comment,
  //                 arguments: rs.data!.convertToEntity);
  //           } else {
  //             Get.toNamed(RouteConfig.comment,
  //                 arguments: rs.data!.convertToEntity);
  //           }
  //         }
  //       } catch (_) {
  //       } finally {
  //         AppLoading.hide();
  //       }
  //
  //       break;
  //     case NotificationType.listGeneralNotify:
  //       final int tabIndex = (int.tryParse(notificationRes.data ?? '') ?? 0) > 1
  //           ? 0
  //           : (int.tryParse(notificationRes.data ?? '') ?? 0);
  //       while (Get.isBottomSheetOpen == true) {
  //         Get.back();
  //       }
  //       AppBottomSheet.showBottomSheet(
  //           title: "Thông báo",
  //           body: NotificationListWidget(tabIndex: tabIndex),
  //           minHeight: Get.height * 0.92);
  //       break;
  //     case NotificationType.generalNotifyDetail:
  //       final rs =
  //           await mainRepo.getDetailEvent(slug: notificationRes.data ?? '');
  //       if (rs.data != null) {
  //         if (rs.data?.id != null) {
  //           AppDatabase().insertNotificationId(rs.data!.id!);
  //           checkNotificationUnRead();
  //         }
  //         if (Get.currentRoute == RouteConfig.notificationContent) {
  //           Get.offAndToNamed(RouteConfig.notificationContent,
  //               arguments: rs.data);
  //         } else {
  //           Get.toNamed(RouteConfig.notificationContent, arguments: rs.data);
  //         }
  //       }
  //       break;
  //     case NotificationType.listVouchers:
  //       if (state.isLoggedIn) {
  //         if (Get.currentRoute == RouteConfig.voucher) {
  //           Get.offAndToNamed(RouteConfig.voucher,
  //               arguments: VoucherStatus.all);
  //         } else {
  //           Get.toNamed(RouteConfig.voucher, arguments: VoucherStatus.all);
  //         }
  //       }
  //       break;
  //     case NotificationType.accountInfo:
  //       if (state.isLoggedIn) {
  //         if (Get.currentRoute == RouteConfig.accountInfo) {
  //           Get.offAndToNamed(RouteConfig.accountInfo);
  //         } else {
  //           Get.toNamed(RouteConfig.accountInfo);
  //         }
  //       }
  //       break;
  //     case NotificationType.accountPassword:
  //       if (state.isLoggedIn) {
  //         if (Get.currentRoute == RouteConfig.changePass) {
  //           Get.offAndToNamed(RouteConfig.changePass);
  //         } else {
  //           Get.toNamed(RouteConfig.changePass);
  //         }
  //       }
  //       break;
  //     case NotificationType.wallet:
  //       if (state.isLoggedIn) {
  //         if (Get.currentRoute == RouteConfig.wallet) {
  //           Get.offAndToNamed(RouteConfig.wallet,
  //               arguments: int.tryParse(notificationRes.data ?? '') ?? 0);
  //         } else {
  //           Get.toNamed(RouteConfig.wallet,
  //               arguments: int.tryParse(notificationRes.data ?? '') ?? 0);
  //         }
  //       }
  //       break;
  //     case NotificationType.listBids:
  //       if (!state.isLoggedIn) return;
  //       if (Get.currentRoute == RouteConfig.bidManager) {
  //         Get.offAndToNamed(RouteConfig.bidManager,
  //             arguments: int.tryParse(notificationRes.data ?? '') ?? 0);
  //       } else {
  //         Get.toNamed(RouteConfig.bidManager,
  //             arguments: int.tryParse(notificationRes.data ?? '') ?? 0);
  //       }
  //       break;
  //     case NotificationType.listFavourites:
  //       if (!state.isLoggedIn) return;
  //       if (Get.currentRoute == RouteConfig.favorite) {
  //         Get.offAndToNamed(RouteConfig.favorite,
  //             arguments: int.tryParse(notificationRes.data ?? '') ?? 0);
  //       } else {
  //         Get.toNamed(RouteConfig.favorite,
  //             arguments: int.tryParse(notificationRes.data ?? '') ?? 0);
  //       }
  //       break;
  //     case NotificationType.bidDetail:
  //       if (!state.isLoggedIn) return;
  //       getProductDetail(
  //           typeCode: TradingOption.yAuction.typeCode,
  //           productId: notificationRes.data ?? '');
  //       break;
  //     case NotificationType.mercariDetail:
  //       if (!state.isLoggedIn) return;
  //       getProductDetail(
  //           typeCode: TradingOption.mercari.typeCode,
  //           productId: notificationRes.data ?? '');
  //       break;
  //     case NotificationType.listCart:
  //       if (!state.isLoggedIn) return;
  //       if (Get.currentRoute == RouteConfig.cart) {
  //         Get.offAndToNamed(RouteConfig.cart);
  //       } else {
  //         Get.toNamed(RouteConfig.cart);
  //       }
  //       break;
  //     case NotificationType.listQuotes:
  //       if (!state.isLoggedIn) return;
  //       if (Get.currentRoute == RouteConfig.orderManager) {
  //         Get.offAndToNamed(RouteConfig.orderManager,
  //             arguments: int.tryParse(notificationRes.data ?? '') ?? 0);
  //       } else {
  //         Get.toNamed(RouteConfig.orderManager,
  //             arguments: int.tryParse(notificationRes.data ?? '') ?? 0);
  //       }
  //       break;
  //     case NotificationType.quoteDetail:
  //     case NotificationType.transitDetail:
  //       if (!state.isLoggedIn) return;
  //       if (Get.currentRoute == RouteConfig.orderTracking) {
  //         Get.offAndToNamed(RouteConfig.orderTracking,
  //             arguments: notificationRes.data ?? '');
  //       } else {
  //         Get.toNamed(RouteConfig.orderTracking,
  //             arguments: notificationRes.data ?? '');
  //       }
  //       break;
  //     case NotificationType.listInvoices:
  //       if (!state.isLoggedIn) return;
  //       if (Get.currentRoute == RouteConfig.invoice) {
  //         Get.offAndToNamed(RouteConfig.invoice,
  //             arguments: InvoiceStatus
  //                 .values[int.tryParse(notificationRes.data ?? '') ?? 0]);
  //       } else {
  //         Get.toNamed(RouteConfig.invoice,
  //             arguments: InvoiceStatus
  //                 .values[int.tryParse(notificationRes.data ?? '') ?? 0]);
  //       }
  //       break;
  //     case NotificationType.invoiceDetail:
  //       if (!state.isLoggedIn) return;
  //       try {
  //         AppLoading.show();
  //         final rs = await mainRepo.getInvoiceDetail(
  //             invoiceCode: notificationRes.data ?? '');
  //         if (rs.isSuccess && rs.data != null) {
  //           if (Get.currentRoute == RouteConfig.invoiceDetail) {
  //             Get.offAndToNamed(RouteConfig.invoiceDetail,
  //                 arguments:
  //                     InvoiceDetailArg(invoice: rs.data!.convertToEntity));
  //           } else {
  //             Get.toNamed(RouteConfig.invoiceDetail,
  //                 arguments:
  //                     InvoiceDetailArg(invoice: rs.data!.convertToEntity));
  //           }
  //         }
  //       } catch (_) {
  //       } finally {
  //         AppLoading.hide();
  //       }
  //
  //       break;
  //     case NotificationType.listTransits:
  //       if (state.isLoggedIn) {
  //         final index = int.tryParse(notificationRes.data ?? '') ?? 0;
  //         late TransitStatus transit;
  //         try {
  //           transit = TransitStatus.values[index];
  //         } catch (_) {
  //           transit = TransitStatus.all;
  //         }
  //         if (Get.currentRoute == RouteConfig.transit) {
  //           Get.offAndToNamed(RouteConfig.transit, arguments: transit);
  //         } else {
  //           Get.toNamed(RouteConfig.transit, arguments: transit);
  //         }
  //       }
  //       break;
  //   }
  // }
  //
  // handlePrint({required String htmlStr}) async {
  //   await Printing.layoutPdf(
  //       onLayout: (PdfPageFormat format) async => await Printing.convertHtml(
  //             format: format,
  //             html: HtmlUtils.generateHtmlFitContentImg(htmlStr),
  //           ));
  // }

  copyText({required String text, required BuildContext context}) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (context.mounted) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          const SnackBar(
            content: Text("Đã sao chép"),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.primary,
            duration: Duration(milliseconds: 500),
          ),
        );
    }
  }

  // checkNotificationUnRead() async {
  //   try {
  //     final result =
  //         await mainRepo.getNotificationsSystem(page: 1, read: false);
  //     final List<NotificationRes> listNotificationUnRead =
  //         result.data?.results ?? [];
  //
  //     final resultEvent = await mainRepo.getListEvent(
  //       page: 1,
  //       size: 100,
  //     );
  //
  //     final listEventIdRead = await AppDatabase().getListNotificationIdRead();
  //     List<EventRes> listEventUnread = (resultEvent.data?.results ?? [])
  //         .where((event) => !event.isRead(listEventIdRead))
  //         .toList();
  //
  //     emit(state.copyWith(
  //         hasUnReadNotify:
  //             listNotificationUnRead.isNotEmpty || listEventUnread.isNotEmpty));
  //   } catch (_) {}
  // }
  //
}
