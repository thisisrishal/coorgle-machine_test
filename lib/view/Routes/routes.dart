import 'package:coorgle_machine_test/view/cart.dart';
import 'package:coorgle_machine_test/view/checkout.dart';
import 'package:coorgle_machine_test/view/drawer.dart';
import 'package:coorgle_machine_test/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../splash_screen.dart';

class Routes {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () =>  HomeScreen()),
    GetPage(name: '/cart', page: () => Cart()),
    GetPage(name: '/checkout', page: () => CheckoutScreen()),
    GetPage(name: '/NavDrawer', page: () => const NavDrawer()),
  ];
}
