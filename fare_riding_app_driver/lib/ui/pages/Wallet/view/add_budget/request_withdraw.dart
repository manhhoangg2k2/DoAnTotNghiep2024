import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/AppBar.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/app_loading.dart';

class RequestWithdraw extends StatefulWidget {
  const RequestWithdraw({super.key});

  @override
  State<RequestWithdraw> createState() => _RequestWithdrawState();
}

class _RequestWithdrawState extends State<RequestWithdraw> {
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _bankName = TextEditingController();
  final TextEditingController _branch = TextEditingController();
  final TextEditingController _owner = TextEditingController();

  String? _budgetError;
  String? _numberError;
  String? _bankNameError;
  String? _branchError;
  String? _ownerError;

  void _validateInputs(double balance) {
    setState(() {
      _budgetError = null;
      _numberError = null;
      _bankNameError = null;
      _branchError = null;
      _ownerError = null;

      // Kiểm tra số tiền
      if (_budgetController.text.isEmpty) {
        _budgetError = "Vui lòng nhập số tiền.";
      } else if (double.tryParse(_budgetController.text) == null) {
        _budgetError = "Số tiền không hợp lệ.";
      } else if (double.parse(_budgetController.text) > balance) {
        _budgetError = "Số tiền cần rút không được lớn hơn số dư hiện tại.";
      }

      // Kiểm tra các trường còn lại
      if (_number.text.isEmpty) _numberError = "Vui lòng nhập số tài khoản.";
      if (_bankName.text.isEmpty) _bankNameError = "Vui lòng nhập tên ngân hàng.";
      if (_branch.text.isEmpty) _branchError = "Vui lòng nhập chi nhánh.";
      if (_owner.text.isEmpty) _ownerError = "Vui lòng nhập tên người sở hữu.";
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppCubit>().state.userInfo;

    return Scaffold(
      appBar: AppBarBase(
        title: 'Tạo yêu cầu rút tiền',
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
                  'Nhập số tiền cần rút',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Số tiền rút cần nhỏ hơn hoặc bằng số dư hiện tại',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _budgetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Số tiền (VNĐ)',
                    border: const OutlineInputBorder(),
                    errorText: _budgetError,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _number,
                  decoration: InputDecoration(
                    labelText: 'Số tài khoản',
                    border: const OutlineInputBorder(),
                    errorText: _numberError,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _bankName,
                  decoration: InputDecoration(
                    labelText: 'Ngân hàng',
                    border: const OutlineInputBorder(),
                    errorText: _bankNameError,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _branch,
                  decoration: InputDecoration(
                    labelText: 'Chi nhánh',
                    border: const OutlineInputBorder(),
                    errorText: _branchError,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _owner,
                  decoration: InputDecoration(
                    labelText: 'Người sở hữu',
                    border: const OutlineInputBorder(),
                    errorText: _ownerError,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Mainbutton(
                  text: "Tạo yêu cầu rút tiền",
                  type: 1,
                  onTap: () async {
                    // Lấy số dư hiện tại
                    final balance = user?.balance ?? 0.0;

                    // Kiểm tra các điều kiện
                    _validateInputs(balance);

                    // Nếu có lỗi, không thực hiện tiếp
                    if (_budgetError != null ||
                        _numberError != null ||
                        _bankNameError != null ||
                        _branchError != null ||
                        _ownerError != null) {
                      return;
                    }

                    // Nếu không có lỗi, thực hiện xử lý yêu cầu
                    AppLoadingIndicator.show(context);
                    try {
                      context.read<AppCubit>().requestWithdraw(double.parse(_budgetController.text), DateTime.now().toIso8601String(), _number.text, _bankName.text, _branch.text, _owner.text);
                      AppLoadingIndicator.hide();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Yêu cầu rút tiền đã được gửi.")),
                      );
                    } catch (error) {
                      AppLoadingIndicator.hide();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Lỗi: $error")),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
