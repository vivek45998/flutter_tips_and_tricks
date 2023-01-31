import 'package:flutter/cupertino.dart';

@immutable
class Person {
  /// a person class uses to demonstrate identification of object
  /// We will override the == operator for this class and use the "identical()"
  /// to determine if two instance of a class point to the same value in memory
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age;

  @override
  int get hashCode => Object.hashAll([
    name,
    age,
  ]);
}