import 'package:braintree/app/core/data/model/user_list.dart';
import 'package:braintree/app/presentation/ui/basic_crud_operation_with_db/create_new_user_data/ctrl/list_of_user_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UpdateTextFieldWidget extends StatelessWidget {
  UpdateTextFieldWidget(
      {Key? key, this.nameController, this.isEnable, this.data})
      : super(key: key);
  TextEditingController? nameController;
  UserListData? data;
  bool? isEnable = false;
  var ctrl = Get.put(UserListCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: nameController,
          enabled: isEnable,
         onChanged: (value){
            ctrl.editData.value.text=value;
            data?.studentName=ctrl.editData.value.text;
            ctrl.updateUserList(data);
         },
        ),
      ),
    );
  }
}
