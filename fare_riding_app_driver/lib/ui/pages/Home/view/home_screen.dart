// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:fare_riding_app/blocs/app_cubit.dart';
// import 'package:fare_riding_app/constant/AppColor.dart';
// import 'package:fare_riding_app/constant/AppFont.dart';
// import 'package:fare_riding_app/constant/AppSize.dart';
// import 'package:fare_riding_app/constant/AppText.dart';
// import 'package:fare_riding_app/models/response/user/user_info_res.dart';
// import 'package:fare_riding_app/ui/common/AppBar.dart';
// import 'package:fare_riding_app/ui/common/app_function.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:retrofit/retrofit.dart';
//
// import '../../../../router/route_config.dart';
// import '../../../common/TextBase.dart';
// import '../cubit/home_cubit.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final UserInfoRes? userInfor = context.read<AppCubit>().state.userInfo!;
//     // PageController _pageController = new PageController();
//     return BlocProvider(
//       create: (_) => HomeCubit(),
//       child: Scaffold(
//         backgroundColor: AppColor.gray_7F7,
//         body: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 Image.asset('assets/images/promotion.jpg'),
//                 Container(
//                   padding: EdgeInsets.all(AppSizes.size_15),
//                   child: Column(
//                     children: [
//                       Switch(
//                         value: context.read<HomeCubit>().state.isActive,
//                         onChanged: (value) {
//                           context.read<HomeCubit>().switchActive();
//                           // Fluttertoast.showToast(
//                           //   msg: _isAppActive ? 'App đã được bật' : 'App đã được tắt',
//                           //   toastLength: Toast.LENGTH_SHORT,
//                           //   gravity: ToastGravity.BOTTOM,
//                           // );
//                         },
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               TextBase(
//                                 text: AppText.welcome + ', ',
//                                 fontSize: AppSizes.size_20,
//                                 fontWeight: AppFonts.semiBold,
//                               ),
//                               TextBase(
//                                 text: userInfor!.name,
//                                 fontSize: AppSizes.size_20,
//                                 fontWeight: AppFonts.semiBold,
//                               )
//                             ],
//                           ),
//                           TextBase(
//                             text: "${formatCurrency(userInfor.balance)}đ",
//                             fontSize: AppSizes.size_18,
//                             color: AppColor.main,
//                             fontWeight: AppFonts.semiBold,
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: AppSizes.size_20,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: AppColor.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.2),
//                               spreadRadius: 1,
//                               blurRadius: 8,
//                               offset: Offset(1, 1),
//                             ),
//                           ],
//                         ),
//                         padding: EdgeInsets.all(AppSizes.size_5),
//                         child: Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: AppColor.gray_8E8,
//                                   borderRadius: BorderRadius.circular(5)),
//                               padding: EdgeInsets.all(AppSizes.size_10),
//                               child: Row(
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/svg/to_location.svg',
//                                     color: AppColor.red_F2F,
//                                     height: 20,
//                                   ),
//                                   SizedBox(
//                                     width: AppSizes.size_10,
//                                   ),
//                                   TextBase(
//                                       text: "Bạn muốn đi đến đâu?",
//                                       fontSize: AppSizes.size_16,
//                                       fontWeight: AppFonts.medium)
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               height: 40,
//                               padding: EdgeInsets.all(8),
//                               child: ListView(
//                                 scrollDirection: Axis.horizontal,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         'assets/svg/add_location.svg',
//                                         height: 25,
//                                         color: AppColor.main,
//                                       ),
//                                       // SizedBox(width: 5,),
//                                       TextBase(
//                                         text: "Thêm nhà",
//                                         fontWeight: AppFonts.medium,
//                                       )
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         'assets/svg/add_location.svg',
//                                         height: 25,
//                                         color: AppColor.main,
//                                       ),
//                                       // SizedBox(width: 1,),
//                                       TextBase(
//                                         text: "Thêm Công ty",
//                                         fontWeight: AppFonts.medium,
//                                       )
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         'assets/svg/add_location.svg',
//                                         height: 25,
//                                         color: AppColor.main,
//                                       ),
//                                       // SizedBox(width: 5,),
//                                       TextBase(
//                                         text: "Thêm địa chỉ",
//                                         fontWeight: AppFonts.medium,
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: (){
//                               Get.offAllNamed(RouteConfig.chooseLocation, arguments: 'car-4');
//                             },
//                             child: iconWithLabel(
//                                 () {}, "assets/svg/car_icon.svg", AppText.car),
//                           ),
//                           iconWithLabel(() {
//                             Get.offAllNamed(RouteConfig.chooseLocation, arguments: 'motorbike');
//                           }, "assets/svg/motorbike_icon.svg",
//                               AppText.motobike),
//                           iconWithLabel(() {}, "assets/svg/delivery_icon.svg",
//                               AppText.delivery),
//                           iconWithLabel(
//                               () {}, "assets/svg/car_icon.svg", AppText.car),
//                         ],
//                       ),
//                       SizedBox(height: 20,),
//                       CarouselSlider(
//                         items: [
//                           Container(
//                             decoration: BoxDecoration(
//                               // borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: Image.asset(
//                                 'assets/images/promotion.jpg',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ],
//                         // carouselController: buttonCarouselController,
//                         options: CarouselOptions(
//                           autoPlay: true,
//                           enlargeCenterPage: true,
//                           viewportFraction: 1,
//                           aspectRatio: 1.50,
//                           initialPage: 0,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget iconWithLabel(Function onTap, String path, String label) {
//     return InkWell(
//       onTap: (){
//         onTap();
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 15, left: 10, right: 10),
//             decoration: BoxDecoration(
//                 color: AppColor.gray_8E8,
//                 borderRadius: BorderRadius.circular(15)),
//             child: SvgPicture.asset(
//               path,
//               height: 50,
//               color: AppColor.primary,
//             ),
//           ),
//           TextBase(
//             text: label,
//             fontSize: AppSizes.size_16,
//             fontWeight: AppFonts.semiBold,
//           )
//         ],
//       ),
//     );
//   }
// }
