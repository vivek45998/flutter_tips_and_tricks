// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class KTextWidget extends StatelessWidget {
  KTextWidget({Key? key, required this.nameController, required this.fullName})
      : super(key: key);
  TextEditingController nameController;
  var fullName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

        Padding(
          padding:  EdgeInsets.only(left: 12.sp),
          child: Container(
            margin: const EdgeInsets.all(4),
            child: Text(fullName),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: fullName,
            ),
          ),
        ),
      ]),
    );
  }
}
