import 'package:get/get.dart';

class AdaptiveBottomNavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
