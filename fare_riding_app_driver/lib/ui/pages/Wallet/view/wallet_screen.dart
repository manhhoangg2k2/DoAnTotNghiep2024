import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/models/enums/transaction_status.dart';
import 'package:fare_riding_app/ui/common/AppBar.dart';
import 'package:fare_riding_app/ui/common/app_function.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/common/app_text_styles.dart';
import 'package:fare_riding_app/ui/pages/Wallet/cubit/wallet_cubit.dart';
import 'package:fare_riding_app/ui/pages/Wallet/view/add_budget/add_budget.dart';
import 'package:fare_riding_app/ui/pages/Wallet/view/add_budget/request_withdraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../models/response/transaction/transaction_res.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletCubit>(
      create: (context) => WalletCubit()..init(),
      child: _WalletScreen(),
    );
  }
}

class _WalletScreen extends StatelessWidget {
  const _WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppCubit>().getUserInfo();

    return Scaffold(
      backgroundColor: AppColor.gray_EEE,
      appBar: AppBarBase(
        title: 'Ví',
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountBalanceSection(context),
            SizedBox(height: 20),
            Text("Lịch sử giao dịch", style: AppTextStyle.blackS20Bold,),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<WalletCubit, WalletState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state.listTransactionHistory.isEmpty) {
                    return Center(
                      child: Text("Không có giao dịch nào."),
                    );
                  }
                  return ListView.separated(
                    reverse: true,
                    itemBuilder: (context, index) {
                      final transaction = state.listTransactionHistory[index];
                      return _buildTransactionItem(transaction);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: state.listTransactionHistory.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountBalanceSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(color: AppColor.white),
      child: Column(
        children: [
          Text(
            "Số dư",
            style: AppTextStyle.blackS20Bold,
          ),
          Text(
            "đ${formatCurrency(context.read<AppCubit>().state.userInfo!.balance)}",
            style: AppTextStyle.blackS40W800.copyWith(
              fontSize: 40,
              color: AppColor.primary,
            ),
          ),
          Text(
            "Tài khoản khả dụng",
            style: AppTextStyle.blackS14.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primary,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DepositScreen()),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.icAdd,
                    height: 22,
                    color: AppColor.white,
                  ),
                  SizedBox(width: 3),
                  Text(
                    "Nạp tiền",
                    style: AppTextStyle.blackS16Bold.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.red_F2F,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestWithdraw()),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.icLogout,
                    height: 22,
                    color: AppColor.white,
                  ),
                  SizedBox(width: 3),
                  Text(
                    "Rút tiền",
                    style: AppTextStyle.blackS16Bold.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(TransactionRes transaction) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: transaction.status.toTransactionStatus()?.getColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.status.toTransactionStatus()?.getLabel ?? "Không xác định",
                    style: AppTextStyle.blackS16Bold.copyWith(color: transaction.status.toTransactionStatus()?.getColor),
                  ),
                  // Text(formatDate(transaction.createdTime)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset(AppImages.icDeposit, height: 24, color: AppColor.black.withOpacity(0.5),),
                  SizedBox(width: 10,),
                  Text(transaction.description ?? "Không có mô tả"),
                ],
              ),
            ],
          ),
          Text("${formatCurrency(double.parse(transaction.amount))}đ", style: AppTextStyle.blackS14Bold,)
        ],
      ),
    );
  }
}
