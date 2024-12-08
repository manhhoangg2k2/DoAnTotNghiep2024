import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/models/response/transaction/transaction_res.dart';
import 'package:meta/meta.dart';

import '../../../../di/app_module.dart';
import '../../../../repository/main_repository.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState());
  final MainRepository mainRepo = getIt.get<MainRepository>();

  void init() async {
    await getListTransactionHistory('all');
  }

  Future<void> getListTransactionHistory(String historyFilter) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await mainRepo.getTransactionHistory(historyFilter: historyFilter);
      if (result.code == 200) {
        emit(state.copyWith(
          isLoading: false,
          listTransactionHistory: result.data,
        ));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      print("Error loading transactions: $e");
    }
  }
}
