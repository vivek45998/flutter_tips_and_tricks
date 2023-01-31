extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension StringParsing on int {
  String parseString() {
    return "${this}";
  }
}

extension Log on Object? {
  void log() => print(this?.toString() ?? '\x1b[101m\x1b[30mNULL\x1b[0m');
}
/// option iterable first element in dart
extension OptionalFirst<T> on Iterable<T>{
  ///returns a null value when data is empty ;
T? get optionalFirst=>isEmpty?null:first;
}

///Finding and Converting JSON Values in Dart
extension Find<K, V, R> on Map<K, V> {
  R? find<T>(
    K key,
    R? Function(T value) cast,
  ) {
    final value = this[key];
    print(value);
    if (value != null && value is T) {
      // print("T=$T value===$value");
      return cast(value as T);
    } else {
      return null;
    }
  }
}

T? withAll<T>(List<T?> optionals, T Function(List<T>) callBack) {
  return optionals.any((element) => element == null)
      ? null
      : callBack(optionals.cast<T>());
}




// mixin HasDescription {
//   @override
//   String toString() {
//     final reflection = rereflect(this);
//     final thisType = MirrorSystem.getName(
//       reflection.type.simpleName,
//     );
//     final variables =
//     reflection.type.declarations.values.whereType<VariableMirror>();
//     final properties = <String, dynamic>{
//       for (final field in variables)
//         field.asKey: reflection
//             .getField(
//           field.simpleName,
//         )
//             .reflectee
//     }.toString();
//     return '$thisType = $properties';
//   }
// }
//
// extension AsKey on VariableMirror {
//   String get asKey {
//     final fieldName = MirrorSystem.getName(simpleName);
//     final fieldType = MirrorSystem.getName(type.simpleName);
//     return '$fieldName ($fieldType)';
//   }
// }
