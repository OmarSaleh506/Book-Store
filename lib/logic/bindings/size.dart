import 'package:get/get.dart';

import '../controllers/responsiveUiController.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ResponsiveUiController>(ResponsiveUiController());
  }
}