import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global_widgets/k_text_field.dart';
import '../ctrl/add_new_user_ctrl.dart';

class AddNewUser extends StatelessWidget {
  AddNewUser({Key? key}) : super(key: key);
  var ctrl = Get.put(AddNewUserCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              KTextWidget(
                nameController: ctrl.nameController.value,
                fullName: "user_name",
              ),
              KTextWidget(
                nameController: ctrl.emailController.value,
                fullName: "student_email",
              ),
              KTextWidget(
                nameController: ctrl.studentRollNumber.value,
                fullName: "student_roll_number",
              ),
              KTextWidget(
                nameController: ctrl.studentAge.value,
                fullName: "student_age",
              ),
              InkWell(
                onTap: () {
                  ctrl.createDB();
                },
                child: Center(child: const Text("Submit")),
              )
            ],
          ),
        ),
      ),
    );
    return GetX(builder: (builder) {});
  }
}
