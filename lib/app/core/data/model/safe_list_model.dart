import 'dart:collection';
///Safe List
class SafeList<T> extends ListBase<T> {
  final List<T> _list;
  final T defaultValue;
  final T absentValue;

  SafeList({
    required this.defaultValue,
    required this.absentValue,
    List<T>? values,
  }) : _list = values ?? [];

  ///Do not through exception when range is less.
  @override
  T operator [](int index) => index < _list.length ? _list[index] : absentValue;

  @override
  void operator []=(int index, T value) => _list[index] = value;

  @override
  int get length => _list.length;
/// return absent value when first and last value is empty.
  @override
  T get first => _list.isNotEmpty ? _list.first : absentValue;

  @override
  T get last => _list.isNotEmpty ? _list.last : absentValue;

  @override
  set length(int newValue) {
    if (newValue < _list.length) {
      _list.length = newValue;
    } else {
      /// expanding list of value , don't through exception because type is not optional instead fill the list of value "default value"
      _list.addAll(List.filled(newValue - _list.length, defaultValue));
    }
  }
}
///end safe list