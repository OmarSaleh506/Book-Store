import 'package:get/get.dart';

import '../viwe/screens/home_screen.dart';

class AppRoutes {
  static const home = Routes.homeScreen;
  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
    )
  ];
}

class Routes {
  static const homeScreen = '/home_screen';
}
