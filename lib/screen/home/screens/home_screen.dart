import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/screen/drawer/custom_drawer.dart';
import 'package:rbf_task/screen/notification/controller/notification_controller.dart';
import 'package:rbf_task/screen/notification/screens/notification_screen.dart';
import 'package:rbf_task/screen/notification/widgets/heads_up_notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final notificationController = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Get.to(NotificationScreen());
            },
            child: HeadsUpNotification(),
          ),
        ],
      ),
    );
  }
}
