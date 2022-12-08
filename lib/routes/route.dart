import 'package:book_store/viwe/screens/home_screen.dart';
import 'package:get/route_manager.dart';
import '../logic/bindings/auth_binding.dart';
import '../logic/bindings/product_binding.dart';
import '../viwe/screens/admin/Add_product_form_screen.dart';
import '../viwe/screens/admin/stock_screen.dart';
import '../viwe/screens/forgot_password_screen.dart';
import '../viwe/screens/login_screen.dart';
import '../viwe/screens/setting/edit_profile_screen.dart';
import '../viwe/screens/setting/profile_screen.dart';
import '../viwe/screens/setting/settings_screen.dart';
import '../viwe/screens/signup_screen.dart';
import '../viwe/screens/user/customer_home.dart';

class AppRoutes {
  static const login = Routes.loginScreen;

  static final routes = [
    GetPage(
      name: Routes.loginScreen,
      page: () => Login_Screen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.settingsScreen,
      page: () => SettingScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.addProductForm,
      page: () => AddProductFromScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.stockScreen,
      page: () => StockScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.customerHome,
      page: () => CustomerHome(),
      binding: ProductBinding(),
    ),
  ];
}

class Routes {
  static const loginScreen = '/loginScreen';
  static const signScreen = '/signScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const profileScreen = '/profileScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const settingsScreen = '/settingsScreen';
  static const homeScreen = '/homeScreen';
  static const stockScreen = '/StockScreen';
  static const addProductForm = '/addProductFromScreen';
  static const editProduct = '/editProductScreen';
  static const customerHome = '/customerHome';
}
