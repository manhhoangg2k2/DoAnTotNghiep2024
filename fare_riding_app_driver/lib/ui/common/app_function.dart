import 'package:intl/intl.dart';

String formatCurrency(double value) {
  int roundedValue = value.round();

  final formatter = NumberFormat("#,###");

  return "${formatter.format(roundedValue)}";
}
