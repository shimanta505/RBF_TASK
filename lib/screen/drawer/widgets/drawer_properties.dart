import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/screen/drawer/controller/drawer_controller.dart';

class DrawerProperties extends StatelessWidget {
  final IconData icon;
  final int drawerIndex;
  DrawerProperties({
    super.key,
    required this.drawerIndex,
    required this.icon,
  });
  final _drawerController = Get.find<CustomDrawerController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(left: 0, right: 0, bottom: 0),
      // padding: EdgeInsets.all(10),
      decoration: decoration,
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(icon),
        ),
      ),
    );
  }

  BoxDecoration get decoration =>
      drawerIndex - _drawerController.selectedIndex == -1
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
            )
          : drawerIndex - _drawerController.selectedIndex == 1
              ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                  ),
                )
              : drawerIndex - _drawerController.selectedIndex == 0
                  ? BoxDecoration(
                      color: Colors.black,
                    )
                  : BoxDecoration().copyWith(color: Colors.white);
}
