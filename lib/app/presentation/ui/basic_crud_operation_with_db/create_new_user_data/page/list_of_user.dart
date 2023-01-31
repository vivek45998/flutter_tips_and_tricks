import 'package:braintree/app/global_widgets/update_text_field.dart';
import 'package:braintree/app/presentation/ui/basic_crud_operation_with_db/create_new_user_data/page/update_user_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../ctrl/list_of_user_ctrl.dart';

// ignore: must_be_immutable
class UserListDetail extends StatelessWidget {
  UserListDetail({Key? key}) : super(key: key);
  var ctrl = Get.put(UserListCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Lists"),
      ),
      body: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            var data = ctrl.userList[index];
            return Container(
              height: 40.sp,
              width: 100.sp,
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
                border: Border.all(color: Colors.white, width: 1.sp),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 6.0.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        UpdateTextFieldWidget(
                          nameController: ctrl.editData.value,
                          isEnable: true,
                          key: UniqueKey(),
                        );
                      },
                      child: Text(
                        data.studentName.toString(),
                        style: TextStyle(
                            color: Colors.red,
                            height: 2.sp,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      width: 90.sp,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            ctrl.editData.value.text = data.studentName!;
                           Get.to(()=> UpdateUser(
                             isEnable: true,
                             data:data,
                             key: UniqueKey(),
                           ));
                          },
                          child: const Icon(Icons.edit)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {ctrl.deleteDataUser(data);}, child: const Icon(Icons.delete)),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: ctrl.userList.length,
        );
      }),
    );
    return GetX(builder: (_ctrl) {});
  }
}
