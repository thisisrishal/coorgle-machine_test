import 'package:coorgle_machine_test/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(size: 42.0),
      ),
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        // ListTile(
        //   title: const Text('Home'),
        //   onTap: () => Get.toNamed('/home'),
        // ),
        ListTile(
          title: const Text('Cart'),
          onTap: () => Get.toNamed('/cart'),
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Coorgle '),
        ),
        body:  HomeScreen(),
        drawer: Drawer(
          child: drawerItems,
        ));
  }
}

// <Null> means this route returns nothing.
class _NewPage extends MaterialPageRoute<void> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Page $id'),
              elevation: 1.0,
            ),
            body: Center(
              child: Text('Page $id'),
            ),
          );
        });
}
