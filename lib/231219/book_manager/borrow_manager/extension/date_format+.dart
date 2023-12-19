import 'package:intl/intl.dart';

extension FormattedString on DateTime {
  String get yyyyMMdd => DateFormat('yyyy/MM/dd').format(this);
}