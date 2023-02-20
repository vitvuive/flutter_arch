import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toYMD(String locale) {
    final formatter = DateFormat.yMd(locale);
    return formatter
        .format(this)
        .split('/')
        .map((e) => '${e.length == 1 ? '0' : ''}$e')
        .join('/');
  }
}
