import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/screen/authentication/sign_in_page.dart';
import 'package:rbf_task/screen/home/screens/home_screen.dart';
import 'package:rbf_task/screen/notification/screens/notification_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
