import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:purchase/presentation/view/walkthrough/walkthrough_screen.dart';
import 'package:purchase/utils/binding/walkthrough_binding.dart';
import 'package:purchase/utils/routes/app_route.dart';

List<GetPage> routeList = [
  GetPage(
    name: AppRoute.walkThrough,
    page: () => const WalkthroughScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
    binding: WalkthroughBinding(),
  ),
];
