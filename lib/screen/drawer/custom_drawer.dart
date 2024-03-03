import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rbf_task/screen/drawer/controller/drawer_controller.dart';
import 'package:rbf_task/screen/drawer/widgets/drawer_properties.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final _drawerController = Get.put(CustomDrawerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomDrawerController>(
      builder: (controller) {
        return Drawer(
          width: 80,
          backgroundColor: Colors.black,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: 50,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    _drawerController.setSelectedIndex(0);
                    Navigator.of(context).pop();
                  },
                  child: DrawerProperties(
                    icon: Icons.close,
                    drawerIndex: 0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _drawerController.setSelectedIndex(1);
                  },
                  child: DrawerProperties(
                    icon: Icons.home,
                    drawerIndex: 1,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _drawerController.setSelectedIndex(2);
                  },
                  child: DrawerProperties(
                    icon: Icons.grid_view,
                    drawerIndex: 2,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _drawerController.setSelectedIndex(3);
                  },
                  child: DrawerProperties(
                    icon: FontAwesomeIcons.cartShopping,
                    drawerIndex: 3,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _drawerController.setSelectedIndex(4);
                  },
                  child: DrawerProperties(
                    icon: Icons.history,
                    drawerIndex: 4,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _drawerController.setSelectedIndex(5);
                  },
                  child: DrawerProperties(
                    icon: Icons.notifications,
                    drawerIndex: 5,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _drawerController.setSelectedIndex(6);
                  },
                  child: DrawerProperties(
                    icon: Icons.account_circle,
                    drawerIndex: 6,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
