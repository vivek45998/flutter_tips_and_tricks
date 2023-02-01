import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'app/presentation/ui/basic_crud_operation_with_db/create_new_user_data/page/list_of_user.dart';
import 'app/presentation/ui/basic_crud_operation_with_db/login_user/page/login_user.dart';
import 'app/presentation/ui/basic_crud_operation_with_db/user_list_upadate_and_delete_operaton /page/add_new_user.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  //This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: UserListDetail (), // UserListDetail(),
        );
      },
    );
  }
}
