import 'package:braintree/app/core/data/model/user_list.dart';
import 'package:braintree/app/presentation/ui/basic_crud_operation_with_db/create_new_user_data/ctrl/list_of_user_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global_widgets/k_text_field.dart';

class UpdateUser extends StatefulWidget {
  UpdateUser({Key? key, this.isEnable, this.data}) : super(key: key);

  UserListData? data;
  bool? isEnable = false;

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  var ctrl = Get.put(UserListCtrl());

  @override
  void initState() {
    ctrl.nameController.value.text = widget.data?.studentName ?? "";
    ctrl.emailController.value.text = widget.data?.studentEmail ?? "";

    ctrl.studentAge.value.text = widget.data?.studentAge ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update user"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  widget.data?.studentName = ctrl.nameController.value.text;
                  widget.data?.studentAge = ctrl.studentAge.value.text;
                  widget.data?.studentEmail = ctrl.emailController.value.text;
                  ctrl.updateUserList(widget.data);
                },
                child: const Center(child: Text("Update")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
