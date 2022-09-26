import 'package:intl/intl.dart';

String getDateString(DateTime date) {
  return DateFormat("yyyy年MM月dd日").format(date);
}
