import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  int selectedIndex = 0;

  setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}
