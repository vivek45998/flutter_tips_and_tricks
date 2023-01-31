import 'package:braintree/app/core/data/local/local_storage.dart';
import 'package:braintree/app/core/data/remote/remote_repo.dart';
import 'package:braintree/app/presentation/ui/basic_crud_operation_with_db/create_new_user_data/page/list_of_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../user_list_upadate_and_delete_operaton /page/add_new_user.dart';

class LogInController extends GetxController {
  var studentEmailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  onInit(){
    super.onInit();
  //  isLoggedIn();

  }


  loggedIn() async {
    if (validateUserDetails()) {
      var email = studentEmailController.value.text.trim();
      var pass = passwordController.value.text.trim();
      final mapData = {"studentEmail": email, "studentPassword": pass};
      var data = await logInUserApi(mapData);
      if (data != null) {
        print("jjhdjfhdjhf");
        LocalStorageData.saveData(LocalStorageData.keyIsLoggedIn, data.id);
        Get.to(()=>UserListDetail());
        print(data.id);
        print("jjhdjfhdjhf");
      }
    }
  }

  validateUserDetails() {
    var email = studentEmailController.value.text.trim();
    var pass = passwordController.value.text.trim();
    if (email.isEmpty) {
      print("Please enter valid email");
      return false;
    } else if (pass.isEmpty) {
      print("Please enter valid pass");
      return false;
    } else {
      return true;
    }
  }

  signUp() {
    Get.to(() => AddNewUser());
  }
}
