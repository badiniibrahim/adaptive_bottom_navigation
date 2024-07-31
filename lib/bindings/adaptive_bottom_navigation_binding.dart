import 'package:adaptive_botton_navigatione/controller/adaptive_bottom_navigation_controller.dart';
import 'package:get/instance_manager.dart';

class AdaptiveBottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdaptiveBottomNavigationController>(
        () => AdaptiveBottomNavigationController());
  }
}
