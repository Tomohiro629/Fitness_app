import 'package:intl/intl.dart';

String getDateString(DateTime date) {
  return DateFormat("yyyy年MM月dd日").format(date);
}

String getRecordTime(DateTime date) {
  return DateFormat("HH時mm分").format(date);
}

String upDateDateString(DateTime date) {
  return DateFormat("yyyyMMdd").format(date);
}
