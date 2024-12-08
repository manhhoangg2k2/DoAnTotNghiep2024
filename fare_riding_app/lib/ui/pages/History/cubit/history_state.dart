part of 'history_cubit.dart';

@immutable
class HistoryState {

  final HistoryFilter historyFilter;
  final List<RideHistoryRes> listRideHistory;

  const HistoryState({
    this.historyFilter = HistoryFilter.all,
    this.listRideHistory = const []
  });

  @override
  List<Object?> get props => [
    historyFilter,
    listRideHistory
  ];

  HistoryState copyWith({HistoryFilter? historyFilter, List<RideHistoryRes>? listRideHistory}) {
    return HistoryState(
      historyFilter: historyFilter ?? this.historyFilter,
      listRideHistory: listRideHistory ?? this.listRideHistory
    );
  }
}

