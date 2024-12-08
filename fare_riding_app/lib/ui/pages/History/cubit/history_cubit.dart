import 'package:bloc/bloc.dart';
import 'package:fare_riding_app/models/enums/history_filter.dart';
import 'package:fare_riding_app/models/response/fare/ride_history_res.dart';
import 'package:fare_riding_app/ui/common/app_loading.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../di/app_module.dart';
import '../../../../repository/main_repository.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryState());

  void Init() async {
    await getListRideHistory();
  }

  final MainRepository mainRepo = getIt.get<MainRepository>();

  Future<void> changeFilter(HistoryFilter historyFilter) async {
    emit(state.copyWith(historyFilter: historyFilter));
    await getListRideHistory();
  }

  Future<void> getListRideHistory() async {
    try {
      final result = await mainRepo.getRideHistory(historyFilter: state.historyFilter.getString);
      if (result.code == 200) {
        emit(state.copyWith(listRideHistory: result.data));
      }
    } catch (e) {}
  }

  Future<String> formatTimestamp(String timestamp) async {
    try {
      await initializeDateFormatting('vi', 'VI');
      DateTime dateTime = DateTime.parse(timestamp);

      final DateFormat formatter = DateFormat("d 'thg' M, yyyy", 'vi');
      print(formatter.format(dateTime));
      return formatter.format(dateTime);
    } catch (e) {
      print(e);
      return "Ngày không hợp lệ";
    }
  }
}
