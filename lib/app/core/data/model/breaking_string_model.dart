
import 'package:braintree/app/core/data/model/identical_object.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Student{
  final String name;
  final String id;
  final String age;
  const Student(this.name,this.age,this.id) ;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Student &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age &&
               id==other.id;

  @override
  int get hashCode => Object.hashAll([
    name,
    age,id,
  ]);
  @override
  String toString()=>"Name:$name,"
  '\nAge:$age,'
  '\nid:$id';
  }