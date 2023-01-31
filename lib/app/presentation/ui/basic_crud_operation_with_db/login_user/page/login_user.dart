import 'package:braintree/app/presentation/ui/basic_crud_operation_with_db/login_user/ctrl/login_ctrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global_widgets/k_text_field.dart';

class LogInUser extends StatelessWidget {
  LogInUser({Key? key}) : super(key: key);
  var ctrl = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogIn "),
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
                nameController: ctrl.studentEmailController.value,
                fullName: "user_email",
              ),
              KTextWidget(
                nameController: ctrl.passwordController.value,
                fullName: "student_password",
              ),
              InkWell(
                onTap: () {
                  ctrl.loggedIn();
                },
                child: const Center(child: Text("LogIn")),
              ),
              InkWell(
                onTap: () {
                  ctrl.signUp();
                },
                child: const Center(
                  child: Text("SignUp"),
                ),
              )
            ],
          ),
        ),
      ),
    );
    return GetX(builder: (builder) {});
  }
}
