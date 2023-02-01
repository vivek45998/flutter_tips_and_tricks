import 'dart:convert';

import 'package:braintree/app/core/data/model/logged_in_user_detail.dart';
import 'package:braintree/app/core/data/model/user_list.dart';
import 'package:braintree/app/core/values/app_network_string.dart';
import 'package:braintree/app/core/values/app_strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:dio/dio.dart';

import '../model/user_data.dart';
var dio = Dio();
extension RemoteRepo on GetxController {

  Future<http.Response> gPayPostApiToSuccessResponse(paymentResult) {
    return http.post(
        Uri.parse(NetworkConstant.gPayCardSaveAndSuccessReturnUrlApi),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(paymentResult)
        // body: jsonEncode(<String, String>{
        //   'name': name,
        // }),
        );
  }

  Future<http.Response> gPayNonce(
    String nonce,
    String? deviceData,
    String? price,
  ) async {
    return await http.post(
      Uri.parse(NetworkConstant.ngrokCheckOutUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nonce': nonce,
        'deviceData': deviceData!,
        'price': price!
      }),
    );
  }


  Future<LoggedInUserDetail?>logInUserApi(data) async {
  final response=  await http.post(
      Uri.parse(NetworkConstant.ngrokLoggedInUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  if(response.statusCode==200){
    var data = LoggedInUserDetail.fromJson(jsonDecode(response.body));
    return data;
  }
  else{
    throw Exception("Failed to user data.");
  }
  }


  Future<http.Response> addNewUserApi(
      {required Map<String, String> data}) async {
    return await http.post(
      Uri.parse(NetworkConstant.ngrokAddUserUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }

  Future<List<UserListData>> fetchUserList() async {
    //var client  = http.Client();
    //var uri = Uri.parse(NetworkConstant.ngrokGetUserUrl);
  var response = await http.get(Uri.parse(NetworkConstant.ngrokGetUserUrl));
    //var response =  await client.get(uri);

    if (response.statusCode == 200) {
      var data = List<UserListData>.from(
          json.decode(response.body).map((x) => UserListData.fromJson(x)));
      print("data=====$data");
      return data;
      // return UserListData.fromJson(jsonDecode(response.body));
    } else {
      print("error====${response.body}");
      throw Exception('Failed to load album');
    }
  }

  updateUserData(data) async {
    var response = await http.put(
      Uri.parse("${NetworkConstant.ngrokUpdateUserUrl}/${data.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:jsonEncode(data),
    );
    if (response.statusCode == 200) {
      var data = UserListData.fromJson(jsonDecode(response.body));
      return data;
    }
    else{
      print("error====${response.body}");
      throw Exception('Failed to load album');
    }
  }

  deleteUserData(data) async {
    var response = await http
        .delete(Uri.parse("${NetworkConstant.ngrokDeleteUserUrl}/${data.id}"));
    if(response.statusCode==200){
      var data=UserListData.fromJson(jsonDecode(response.body),);
      return data;
    }else{
      print("error====${response.body}");
      throw Exception("Failed to delete data");
    }
  }

  getUserDetailWithAuthToken() async {
    var response = await http.get(Uri.parse(NetworkConstant.userListApi),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization":NetworkConstant.authKey
    },);
    //var response =  await client.get(uri);

    if (response.statusCode == 200) {
      var data = UserList.fromJson(jsonDecode(response.body));
      print("data=====$data");
      return data;
      // return UserListData.fromJson(jsonDecode(response.body));
    } else {
      print("error====${response.body}");
      throw Exception('Failed to load album');
    }
  }
}
