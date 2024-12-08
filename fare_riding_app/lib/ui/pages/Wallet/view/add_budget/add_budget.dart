import 'package:dio/dio.dart';
import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/ui/common/AppBar.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:fare_riding_app/ui/common/app_dialog.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/common/app_loading.dart';
import 'package:fare_riding_app/ui/common/app_snackbar.dart';
import 'package:fare_riding_app/ui/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  String imageUrl = '';
  final _budgetController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> generateQR(String amount, String description) async {
    final url =
        await 'https://img.vietqr.io/image/970422-0372782087-compact2.png?amount=${_budgetController.text}&addInfo=${_descriptionController.text}';
    setState(() {
      imageUrl = url;
    });
  }

  Future<void> _downloadImage(String url) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final saveDir =
          await getExternalStorageDirectory(); // Đường dẫn lưu trữ ngoài
      final savePath =
          '${saveDir!.path}/${DateTime.now().millisecondsSinceEpoch}.png';

      // Tải ảnh bằng Dio
      final dio = Dio();
      await dio.download(url, savePath);

      AppSnackbar.showInfo(
          title: "Thông báo", message: "Tải về ảnh thành công");
    } catch (e) {
      AppSnackbar.showError(
          title: "Lỗi", message: "Tải về ảnh không thành công");
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.request();
    return status.isGranted;
  }

  @override
  void dispose() {
    _budgetController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveBudget() {
    final String budget = _budgetController.text;
    final String description = _descriptionController.text;

    if (budget.isEmpty || double.tryParse(budget) == null) {
      _showErrorDialog('Vui lòng nhập số tiền hợp lệ.');
      return;
    }

    if (description.isEmpty) {
      _showErrorDialog('Vui lòng nhập mô tả.');
      return;
    }

    Navigator.of(context).pop({
      'budget': double.parse(budget),
      'description': description,
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lỗi'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBase(
        title: 'Nạp tiền vào tài khoản',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nhập số tiền cần nạp',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _budgetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Số tiền (VNĐ)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _descriptionController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Mô tả',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Mainbutton(
                    text: "Tạo mã QR thanh toán",
                    type: 1,
                    onTap: () async {
                      AppLoadingIndicator.show(context);
                      await generateQR(
                          _budgetController.text, _descriptionController.text);
                      AppLoadingIndicator.hide();
                    }),
              ],
            ),
            if (imageUrl != '') ...[
              Center(
                  child: Image.network(
                '$imageUrl',
                height: 400,
              )),
              Center(
                child: InkWell(
                  onTap: () async {
                    if (await _requestPermission(Permission.storage)) {
                      await _downloadImage(imageUrl);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Không có quyền lưu ảnh"),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImages.icDownload,
                        height: 50,
                      ),
                      Text(
                        "Tải ảnh",
                        style: AppTextStyle.blackS20Bold
                            .copyWith(color: AppColor.primary),
                      )
                    ],
                  ),
                ),
              ),
              Mainbutton(
                text: "Hoàn thành thanh toán",
                type: 1,
                onTap: () {
                  AppDialog.showConfirmDialog(
                    text: "Bạn chắc chắn đã hoàn thành giao dịch?",
                    onConfirm: () async {
                      final result = await context.read<AppCubit>().requestDeposit(
                        double.parse(_budgetController.text),
                        DateTime.now().toIso8601String(),
                        _descriptionController.text,
                      );
                      if(result){
                        AppSnackbar.showInfo(title: "Thành công", message: "Yêu cầu nạp tiền thành công");
                      }
                      else{
                        AppSnackbar.showError(title: "Thất bại", message: "Yêu cầu nạp tiền thất bại");
                      }
                    },
                  );
                },
              )
            ],
          ],
        ),
      ),
    );
  }
}
