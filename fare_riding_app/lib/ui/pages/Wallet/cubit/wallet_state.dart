part of 'wallet_cubit.dart';

class WalletState {
  final bool isLoading;
  final List<TransactionRes> listTransactionHistory;

  WalletState({
    this.isLoading = false,
    this.listTransactionHistory = const [],
  });

  WalletState copyWith({
    bool? isLoading,
    List<TransactionRes>? listTransactionHistory,
  }) {
    return WalletState(
      isLoading: isLoading ?? this.isLoading,
      listTransactionHistory: listTransactionHistory ?? this.listTransactionHistory,
    );
  }
}
