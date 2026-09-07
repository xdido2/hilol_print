part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String toDate([String? pattern]) => DateFormat(pattern ?? 'dd.MM.yyyy').format(this);
}
