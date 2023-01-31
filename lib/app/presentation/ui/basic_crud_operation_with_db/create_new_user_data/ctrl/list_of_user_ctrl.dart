import 'package:braintree/app/core/data/model/user_list.dart';
import 'package:braintree/app/core/data/remote/remote_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserListCtrl extends GetxController{
    var user=UserListData().obs;
   var userList=<UserListData>[].obs;
   var editData=TextEditingController().obs;
    var nameController = TextEditingController().obs;
    var studentRollNumber = TextEditingController().obs;
    var emailController=TextEditingController().obs;
    var studentAge=TextEditingController().obs;
   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserList();
  }
  getUserList() async {
     userList.clear();
     var data=await  fetchUserList();
     print(data);
      userList.addAll(data);
      print("userList===========$userList");
      userList.refresh();
     update();
  }
  updateUserList(UserListData? data) async {
     print("==========update user list=====");
    // user.value=data;
      user.value=await updateUserData(data);
     if(user.value!=null){
     await  getUserList();
     Get.back();
     }
  }
  deleteDataUser(UserListData data) async {
    print("delete====Start");
    user.value=await deleteUserData(data);
    if(user.value!=null){
      print(user.value.studentName);
      await getUserList();
      print("delete====end");
    }
  }

}