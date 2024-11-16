// /**
//  * Copyright © ChuTiem.vn, 2022
//  * @author ducbui
//  * @email ducbui1890@gmail.com
//  * Hanoi, 01/04/2022
//  */
//
// import 'package:chutiem_mini_shop/service/AppService.dart';
// import 'package:chutiem_mini_shop/service/BatchService.dart';
// import 'package:chutiem_mini_shop/service/ConfigService.dart';
// import 'package:chutiem_mini_shop/service/CustomerService.dart';
// import 'package:chutiem_mini_shop/service/EmployeeService.dart';
// import 'package:chutiem_mini_shop/service/ProductService.dart';
// import 'package:chutiem_mini_shop/service/ReceiptService.dart';
// import 'package:chutiem_mini_shop/service/ReportService.dart';
// import 'package:chutiem_mini_shop/service/ShopService.dart';
// import 'package:chutiem_mini_shop/service/TransactionService.dart';
// import 'package:chutiem_mini_shop/service/passive/SynDataService.dart';
// import '../service/PaymentMethodService.dart';
// import '../service/RoleService.dart';
// import '../service/StorageService.dart';
// import 'app_module.dart';
//
// Future<void> serviceConfigDI() async {
//   getIt.registerLazySingleton<SynDataService>(() => SynDataService());
//   getIt.registerLazySingleton<AppService>(() => AppServiceImpl());
//   getIt.registerLazySingleton<ProductService>(() => ProductServiceImpl());
//   getIt.registerLazySingleton<CustomerService>(() => CustomerServiceImpl());
//   getIt.registerLazySingleton<TransactionService>(() => TransactionServiceImpl());
//   getIt.registerLazySingleton<ReceiptService>(() => ReceiptServiceImpl());
//   getIt.registerLazySingleton<ConfigService>(() => ConfigServiceImpl());
//   getIt.registerLazySingleton<BatchService>(() => BatchServiceImpl());
//
//   getIt.registerFactory<EmployeeService>(() => EmployeeServiceImpl());
//   getIt.registerFactory<ShopService>(() => ShopServiceImpl());
//   getIt.registerFactory<PaymentMethodService>(() => PaymentMethodServiceImpl());
//   getIt.registerFactory<RoleService>(() => RoleServiceImpl());
//   getIt.registerFactory<ReportService>(() => ReportServiceImpl());
//   getIt.registerFactory<StorageService>(() => StorageServiceImpl());
// }