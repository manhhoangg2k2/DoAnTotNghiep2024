import 'package:fare_riding_app/ui/common/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../blocs/app_cubit.dart';
import '../common/app_colors.dart';
import '../common/app_images.dart';
import '../common/app_text_styles.dart';

class BaseDialogWidget extends StatefulWidget {
  const BaseDialogWidget({
    Key? key,
    required this.title,
    this.description,
    this.backgroundColor,
    this.onConfirm,
    this.onCancel,
    this.textConfirm,
    this.textCancel,
    this.contentDialog,
    this.titleColor,
    this.showCheckbox = false,
  }) : super(key: key);

  final String title;
  final Color? titleColor;
  final String? description;
  final String? textConfirm;
  final String? textCancel;
  final Color? backgroundColor;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? contentDialog;
  final bool showCheckbox;

  @override
  _BaseDialogWidgetState createState() => _BaseDialogWidgetState();
}

class _BaseDialogWidgetState extends State<BaseDialogWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: widget.backgroundColor ?? AppColors.backgroundLight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(10).r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              widget.title,
              style: widget.titleColor != null
                  ? AppTextStyle.header.copyWith(color: widget.titleColor)
                  : AppTextStyle.header,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: widget.contentDialog ??
                Text(
                  widget.description ?? '',
                  style: AppTextStyle.description,
                ),
          ),
          if (widget.showCheckbox) ...[
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primary,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                InkWell(
                  onTap:()=> setState(() {
                    isChecked = !isChecked;
                  }),
                  child: Text(
                    'Tôi đã đọc và hiểu thông tin này',
                    style: AppTextStyle.description,
                  ),
                ),
              ],
            ),
            const SolidAppDivider(),
          ] else
            SizedBox(height: 10.h),
          SizedBox(
            height: 50.h,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: widget.onCancel,
                    child: Text(
                      widget.textCancel ?? 'Hủy',
                      style: AppTextStyle.buttonOptional
                          .copyWith(color: AppColors.textDark),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: widget.showCheckbox && !isChecked
                        ? null
                        : widget.onConfirm,
                    child: Text(
                      widget.textConfirm ?? 'Đồng ý',
                      style: AppTextStyle.button.copyWith(
                          color: widget.showCheckbox && !isChecked
                              ? Colors.grey
                              : AppColors.textDark),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MercariInstructionDialogWidget extends StatefulWidget {
  const MercariInstructionDialogWidget({
    this.onConfirm,
    this.onCancel,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  @override
  _MercariInstructionDialogWidget createState() => _MercariInstructionDialogWidget();
}

class _MercariInstructionDialogWidget extends State<MercariInstructionDialogWidget> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(const Radius.circular(10).r),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Center(
                      child: Text(
                          'Hướng dẫn mua hàng Mercari',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.blackS16Bold.copyWith(color: AppColors.primary)
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.close, color: AppColors.textDark),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Text('Quý khách có thể dễ dàng mua sắm trên Mercari theo các bước sau đây:',softWrap: true,),
                    SizedBox(height: 10.w),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Vòng tròn vàng
                              Container(
                                width: 10.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                                Container(
                                  width: 2.w,
                                  height: 24.h,
                                  color: Colors.yellow,
                                ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Đặt hàng thành công trên website',
                                style: AppTextStyle.blackS14Bold,
                                softWrap: true,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Lựa chọn sản phẩm bạn mong muốn, sau đó tiến haành đặt hàng và hoàn tất thanh toán',
                                style: AppTextStyle.description,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Vòng tròn vàng
                              Container(
                                width: 10.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 2.w,
                                height: 24.h,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Xử lý đơn hàng',
                                style: AppTextStyle.blackS14Bold,
                                softWrap: true,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Sau khi tiếp nhận đơn hàng, chúng tôi sẽ kiểm tra sản phẩm trên Mercari để đảm bảo chất lượng. Có hai hình thức xử lý đơn hàng:',
                                style: AppTextStyle.description,
                                softWrap: true,
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Text(
                                      '⚡ Siêu tốc: Đối với các đơn hàng từ Seller uy tín và vận chuyển có Tracking, việc mua hàng sẽ đươợc thực hiện ngay lập tức.',
                                      style: AppTextStyle.description,
                                      softWrap: true,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: SolidAppDivider(),
                                    ),
                                    Text(
                                      '🔰 Tiêu chuẩn: Thực hiện kiểm tra đảm bảo chất lượng đơn hàng, mua hàng sau 1-2 phút.',
                                      style: AppTextStyle.description,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Vòng tròn vàng
                              Container(
                                width: 10.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 2.w,
                                height: 24.h,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mua hàng thành công',
                                style: AppTextStyle.blackS14Bold,
                                softWrap: true,
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Theo dõi đơn hàng trong mục Quản lý đơn hàng',
                                style: AppTextStyle.description,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              SizedBox(
                height: 50.h,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: TextButton(
                    onPressed:() {
                      Get.back();
                    },
                    child: Center(
                      child: Text(
                        'Đóng',
                        style: AppTextStyle.button.copyWith(
                            color: AppColors.textLight),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconDialogWidget extends StatelessWidget {
  const IconDialogWidget({
    super.key,
    this.backgroundColor,
    this.image,
    this.title,
    this.description,
    this.textConfirm,
    this.textReject,
    this.onConfirm,
    this.onReject,
    this.bgColorConfirm = AppColors.primary,
  });

  final Color? backgroundColor;
  final Color bgColorConfirm;
  final Image? image;
  final String? title;
  final String? description;
  final String? textConfirm;
  final String? textReject;
  final VoidCallback? onConfirm;
  final VoidCallback? onReject;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor ?? AppColors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          if (image != null)
            Column(
              children: [
                image!,
                SizedBox(height: 16.h),
              ],
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              title ?? '',
              style: AppTextStyle.header,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              description ?? '',
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.description.copyWith(color: AppColors.textGrey),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              if (textReject != null)
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: onReject ??
                          () {
                            Get.back();
                          },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                            ),
                            border: Border(
                              top: BorderSide(
                                width: 0.5.r,
                                color: AppColors.dividerLight,
                              ),
                              right: BorderSide(
                                width: 0.5.r,
                                color: AppColors.dividerLight,
                              ),
                            )),
                        height: 50.h,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            textReject ?? 'Đóng',
                            style: AppTextStyle.buttonOptional,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: onConfirm ??
                        () {
                          Get.back();
                        },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: textReject != null
                              ? Radius.zero
                              : Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                        border: Border(
                          top: BorderSide(
                            width: 0.5.r,
                            color: AppColors.dividerLight,
                          ),
                        ),
                        color: textReject != null
                            ? bgColorConfirm
                            : AppColors.backgroundLight,
                      ),
                      height: 50.h,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          textConfirm ?? 'Đóng',
                          style: textReject != null
                              ? AppTextStyle.buttonOptional
                                  .copyWith(color: AppColors.textWhite)
                              : AppTextStyle.buttonOptional,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
//
// class NoteDialogWidget extends StatefulWidget {
//   const NoteDialogWidget({
//     super.key,
//     this.backgroundColor,
//     this.title,
//     this.message,
//     this.hint,
//     this.onReject,
//     this.textReject,
//     this.onConfirm,
//     this.textConfirm,
//   });
//
//   final Color? backgroundColor;
//   final String? title;
//   final String? message;
//   final String? hint;
//   final VoidCallback? onReject;
//   final String? textReject;
//   final ValueChanged<String>? onConfirm;
//   final String? textConfirm;
//
//   @override
//   State<NoteDialogWidget> createState() => _NoteDialogWidgetState();
// }
//
// class _NoteDialogWidgetState extends State<NoteDialogWidget> {
//   final TextEditingController _controller = TextEditingController();
//   late bool _disable;
//
//   @override
//   void initState() {
//     _disable = true;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: widget.backgroundColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(10.r)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(height: 20.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.title ?? '',
//                   style: AppTextStyle.header,
//                 ),
//                 SizedBox(height: 16.h),
//                 Text(
//                   widget.message ?? '',
//                   style: AppTextStyle.description
//                       .copyWith(color: AppColors.textGrey),
//                 ),
//                 SizedBox(height: 16.h),
//                 AppTextFieldWidget(
//                   controller: _controller,
//                   hintText: widget.hint,
//                   fillColor: AppColors.bgInput,
//                   textInputAction: TextInputAction.next,
//                   borderWidth: 0,
//                   maxLines: 2,
//                   onChanged: (value) {
//                     setState(() {
//                       _disable = value.isEmpty;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Row(
//             children: [
//               Expanded(
//                 child: Center(
//                   child: InkWell(
//                     onTap: widget.onReject ??
//                         () {
//                           Get.back();
//                         },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(10.r),
//                           ),
//                           border: Border(
//                             top: BorderSide(
//                               width: 0.5.r,
//                               color: AppColors.dividerLight,
//                             ),
//                             right: BorderSide(
//                               width: 0.5.r,
//                               color: AppColors.dividerLight,
//                             ),
//                           )),
//                       height: 50.h,
//                       width: double.infinity,
//                       child: Center(
//                         child: Text(
//                           widget.textReject ?? '',
//                           style: AppTextStyle.buttonOptional,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Center(
//                   child: InkWell(
//                     onTap: _disable
//                         ? null
//                         : () {
//                             if (widget.onConfirm != null) {
//                               widget.onConfirm!(_controller.text);
//                             }
//                           },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(10.r),
//                         ),
//                         border: Border(
//                           top: BorderSide(
//                             width: 0.5.r,
//                             color: AppColors.dividerLight,
//                           ),
//                         ),
//                         color: _disable
//                             ? AppColors.primaryDisable
//                             : AppColors.primary,
//                       ),
//                       height: 50.h,
//                       width: double.infinity,
//                       child: Center(
//                         child: Text(
//                           widget.textConfirm ?? '',
//                           style: AppTextStyle.buttonOptional
//                               .copyWith(color: AppColors.textWhite),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
