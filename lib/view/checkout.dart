import 'package:coorgle_machine_test/view/AppConstants.dart/constants.dart';
import 'package:coorgle_machine_test/view/drawer.dart';
import 'package:coorgle_machine_test/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                AppSize.kSizedBox10h,
                CustomTextField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter full name';
                      }
                      return '';
                    },
                    icon: const Icon(Icons.person),
                    label: 'Full Name'),
                AppSize.kSizedBox10h,
                CustomTextField(
                    keyboardType: TextInputType.phone,
                    controller: _mobileController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter mobile number';
                      }
                      return '';
                    },
                    icon: const Icon(Icons.phone),
                    label: 'Mobile Number'),
                AppSize.kSizedBox10h,
                CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) => validateEmail(value),
                    icon: const Icon(Icons.email),
                    label: 'Email'),
                AppSize.kSizedBox10h,
                AppSize.kSizedBox10h,
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() ||
                        _nameController.text.isNotEmpty ||
                        _mobileController.text.isNotEmpty ||
                        _emailController.text.isNotEmpty ||
                        _passwordController.text.isNotEmpty) {
                      Get.snackbar('Horeeeeeey!', 'Order Placed');
                      Get.offAll(const NavDrawer());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.sp, 48.sp)),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        color: AppColor.kWhite, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }
}
