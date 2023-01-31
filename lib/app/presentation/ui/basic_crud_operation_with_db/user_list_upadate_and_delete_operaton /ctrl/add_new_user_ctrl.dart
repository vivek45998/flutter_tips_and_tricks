import 'package:braintree/app/core/data/remote/remote_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../create_new_user_data/ctrl/list_of_user_ctrl.dart';
import '../../create_new_user_data/page/list_of_user.dart';

class AddNewUserCtrl extends GetxController {
  var nameController = TextEditingController().obs;
  var studentRollNumber = TextEditingController().obs;
  var emailController=TextEditingController().obs;
  var studentAge=TextEditingController().obs;

  createDB() async {
    if (validUserData()) {
     var userData={
      "studentName":nameController.value.text.trim().toString(),
      "studentEmail":emailController.value.text.trim().toString(),
      "studentAge":studentAge.value.text.trim().toString(),
      "studentRollNumber":studentRollNumber.value.text.trim().toString()
     };
     print("check====");
      http.Response response = await addNewUserApi(data:userData);
      print("gdgjdjf add user");
      if(response.statusCode==200){
        // var ctrl= Get.isRegistered<UserListCtrl>()
        //     ? Get.find<UserListCtrl>()
        //     : Get.put(UserListCtrl(),permanent: true);
        // await ctrl.getUserList();
        Get.to(()=>UserListDetail());
      }
      else{
        print("response=========${response.body}");
        throw Exception("Hello");
      }

      print("response=========${response.body}");
    }
    update();
  }

  validUserData() {
    var userName = nameController.value.text.trim().toString();
    var userRollNumber = studentRollNumber.value.text.trim().toString();
    var userEmail = emailController.value.text.trim().toString();
    var userAge = studentAge.value.text.trim().toString();
    if (userName.isEmpty) {
      print("please input user data");
      return false;
    } else if (userEmail.isEmpty) {
      print("Please Enter user email");
      return false;
    }else if (userRollNumber.isEmpty) {
      print("Please Enter RollNumber.");
      return false;
    } else if (userAge.isEmpty) {
      print("Please enter user age.");
      return false;
    }  else {
      print("===================Success==========");
      return true;
    }
    update();
  }
}
