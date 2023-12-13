import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:purchase/controller/bottomNavigation/bottomNaviagtion_controller.dart';
import 'package:purchase/presentation/view/bottom_navigation/bottom_navigation_screen.dart';
import 'package:purchase/presentation/view/indend/add_indend_screen.dart';
import 'package:purchase/presentation/view/indend/view_indend_screen.dart';
import 'package:purchase/presentation/view/login/login_screen.dart';
import 'package:purchase/presentation/view/more_approval/indend_approval_screen.dart';
import 'package:purchase/presentation/view/register/vendor_register_screen.dart';
import 'package:purchase/presentation/view/splash/splash_screen.dart';
import 'package:purchase/presentation/view/vendor/vendor_screen.dart';
import 'package:purchase/presentation/view/walkthrough/walkthrough_screen.dart';
import 'package:purchase/utils/binding/bottomNavigation/bottomNavigation_binding.dart';
import 'package:purchase/utils/binding/indend/indend_binding.dart';
import 'package:purchase/utils/binding/indend/view_indend_binding.dart';
import 'package:purchase/utils/binding/login/login_binding.dart';
import 'package:purchase/utils/binding/more_approval/indend_approval_binding.dart';
import 'package:purchase/utils/binding/register/register_binding.dart';
import 'package:purchase/utils/binding/vendor/vendor_binding.dart';
import 'package:purchase/utils/binding/walkthrough/walkthrough_binding.dart';
import 'package:purchase/utils/routes/app_route.dart';

List<GetPage> routeList = [
  GetPage(
    name: AppRoute.splash,
    page: () => SplashScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: WalkthroughBinding(),
  ),
  GetPage(
    name: AppRoute.walkThrough,
    page: () => WalkthroughScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: WalkthroughBinding(),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => LoginScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: LoginBinding(),
  ),
  GetPage(
    name: AppRoute.vendotRegister,
    page: () => VendorRegisterScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: RegisterBinding(),
  ),
  GetPage(
    name: AppRoute.bottomNavigation,
    page: () => BottomNavigationScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: BottomNavigationBinding(),
  ),
  GetPage(
    name: AppRoute.addIndend,
    page: () => AddIndentScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: IndendBinding(),
  ),

  GetPage(
    name: AppRoute.viewIndend,
    page: () => ViewIndendScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: ViewIndendBinding(),
  ),

  //more approval bindings
  GetPage(
    name: AppRoute.indendApproval,
    page: () => IndendApproval(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: IndendApprovalBinding(),
  ),

  GetPage(
    name: AppRoute.vendor,
    page: () => VendorScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: VendorBinding(),
  ),
];
