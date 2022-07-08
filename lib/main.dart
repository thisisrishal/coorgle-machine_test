import 'package:coorgle_machine_test/model/cart_model.dart';
import 'package:coorgle_machine_test/view/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'view/AppConstants.dart/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());

  var box = await Hive.openBox<CartModel>('cartBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fashio',
              theme: ThemeData(
                scaffoldBackgroundColor: AppColor.kWhite,
                fontFamily: 'poppins',
              ),
              initialRoute: '/splash',
              getPages: Routes.routes,
            ));
  }
}
