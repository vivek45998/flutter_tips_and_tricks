import 'package:braintree/app/core/values/example_data.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/breaking_string_model.dart';
import '../../../../core/data/model/example_model.dart';
import '../../../../core/data/model/identical_object.dart';
import '../../../../core/data/model/safe_list_model.dart';



class PracticePageCtrl extends GetxController {
  var generateValue = 0.obs;
  var streamGenerateValue = 0.obs;

  canonicalizedMaps() {
    final canonicalized = CanonicalizedMap.from(
      studentData,
      (key) {
        if (kDebugMode) {
          print(key.characters.first.toLowerCase());
        }
        return key.characters.first.toLowerCase();
      },
    );
    if (kDebugMode) {
      print(canonicalized);
    }
    print("42".parseInt());
    print(42.parseString());
    testIt();

    ///optional chek"_start"
    getFullData(null, null);
    getFullData("data", null);
    getFullData(null, "data");
    getFullData("vivek", "yadav");

    ///optional chek"_end"
  }

  void testIt() {
    // get the age
    final String? ageAsString = json.find(
      'age',
      (int value) => 'Your age is $value',
    );
    ageAsString.log();

    /// force get the name using ! operator
    final String helloName = json.find(
      'name',
      (String name) => 'Hello, $name',
    )!;
    helloName.log();

    /// non-existent key
    final String? address = json.find(
      'address',
      (String address) => 'You live at $address',
    );
    address.log();

    ///safe List start
    print("Safe List");
    const notFound = 'NOT_FOUND';
    const defaultString = '';

    final myList = SafeList(
      defaultValue: defaultString,
      absentValue: notFound,
      values: ['Bar', 'Baz'],
    );
    if (kDebugMode) {
      print(myList[0]); // Bar
      print(myList[1]); // Baz
      print(myList[2]); // NOT_FOUND

      myList.length = 4;
      print(myList[3]); // ''

      myList.length = 0;
      print(myList.first); // NOT_FOUND
      print(myList.last);
      print("Safe List");
    }

    /// end safe List

    ///optional iterable first element in dart "_Start"
    print("first element in dart");
    printName();
    printName('Foo');
    printName(null, []);
    printName(null, ['Bar']);
    print("optional element in dart");

    ///optional iterable first element in dart "_End"
  }

  String? getFullData(String? firstName, String? lastName) {
    return withAll([firstName, lastName], (name) => name.join("")) ??
        "DataEmpty";
  }

  void printName([
    String? name,
    List<String>? orFirstNameFoundInList,
  ]) {
    name ??= orFirstNameFoundInList?.optionalFirst ?? 'No name is found';
    name.log();
  }

  ///start to check generator function with yield keyword and also using a sync* and async*
  generatorMainFunction(int num) {
    print("Create a generator function");
    Iterable<int> numbers = generateNumber(num);
    print("start to iterate numbers");
    for (int i in numbers) {
      generateValue.value = i;
      print("\ni increment value is= $i");
      update();
    }
    print("end of main generator function ");
  }

  Iterable<int> generateNumber(int num) sync* {
    print("start to generate  a value");
    for (int i = 0; i < num; i++) {
      //  generateValue.value=i;
      yield i;
    }
    update();
    print("end to generate a value");
  }

  /// end to check generator function

  /// stream generator _start
  streamGeneratorFunction() {
    if (kDebugMode) {
      print("start to stream generate a value.");
    }
    Stream<int> numbers = generateNumberFunction(5);
    numbers.listen((i) {
      streamGenerateValue.value = i;
      print("i=$i");
    });
    update();
    print("end to streamGenerateFunction");
  }

  Stream<int> generateNumberFunction(int num) async* {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    if (kDebugMode) {
      print("waiting some times==");
    }
    await Future.delayed(
      const Duration(seconds: 5),
    );
    if (kDebugMode) {
      print("start stream generateValue");
    }
    for (int i = 0; i < num; i++) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      yield i;
    }
    if (kDebugMode) {
      print("end to stream generate value");
    }
    if (kDebugMode) {
      print(
          "So, it’s the same thing as in sync* generator, just different order of prints 'in this version we do not have to wait for the generator function to finish, to be able to reach end of main.'Generator function does not get executed until someone tries to listen to the stream it returns.");
    }
  }

  ///stream generator _end

  ///Check  identical object
  identicalFunction(){
    var o = new Object();
   // var isIdentical = identical(o, new Object());
   // var isIdentical = identical(o, o);
   // var isIdentical =  identical(const Object(), const Object());
  //  var isIdentical =  identical([1], [1]);
   // var isIdentical = identical(const [1], const [1]);
   // var isIdentical =identical(const [1], const [2]);
    var isIdentical =identical(2, 1 + 1);
    print("isIdentical=$isIdentical");
    ///Check whether two references are to the same object.
    var person1 = Person(name: 'Vandana', age: 42);
    var person2 = Person(name: 'Vandana', age: 42);
    var person3 = Person(name: 'Vandana', age: 43);
    /// We can use first manually identical function to check both object value are same
    /// after we can use overrideen == operator to check operation equality.
    if(person1==person2){
      print("===true");
    }
    else{
      print("==false");
    }

    (person1==person2).log();
    (person2==person3).log();
    (person3==person3).log();
    (person3==person3).log();
    (person3==person3).log();



  }
  ///End to check identical object

  ///Breaking String
 breakingString(){
    var std=Student("vivek",'43','12');
    var std1=Student("vivek",'43','12');
    if(std==std1){
      print("true");
    }
    else{
      print("false");
    }
    std.log();
 }

}
