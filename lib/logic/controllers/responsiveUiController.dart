import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../utils/sizes.dart';

class ResponsiveUiController extends GetxController {
  var responsiveAttributes;

  ResponsiveUiController() {
    if (kIsWeb) {
      responsiveAttributes = Web();
    } else if (Platform.isIOS || Platform.isAndroid) {
      responsiveAttributes = Mobile();
    } else {
      responsiveAttributes = Web();
    }
  }
}
