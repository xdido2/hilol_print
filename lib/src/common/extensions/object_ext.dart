part of 'extensions.dart';

extension ObjectExt on Object? {
  bool get isNull => this == null;
  bool get isNotNull => !isNull;

  T map<T>({required T Function(Object value) onValue, required T Function() onNull}) =>
      isNull ? onNull() : onValue(this!);
}
