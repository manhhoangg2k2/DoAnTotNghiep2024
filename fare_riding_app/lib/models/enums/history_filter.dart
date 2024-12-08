enum HistoryFilter {
  all,
  day,
  week,
  month
}

extension HistoryFilterExt on HistoryFilter {
  String get getLabel {
    switch (this) {
      case HistoryFilter.all:
        return "Tất cả";
      case HistoryFilter.day:
        return "Ngày";
      case HistoryFilter.month:
        return "Tháng";
      case HistoryFilter.week:
        return "Tuần";
    }
  }
  String get getString {
    switch (this) {
      case HistoryFilter.all:
        return "all";
      case HistoryFilter.day:
        return "day";
      case HistoryFilter.month:
        return "month";
      case HistoryFilter.week:
        return "week";
    }
  }
}
