import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_test_app/data/routes/paths.dart';
import 'package:google_test_app/presentation/screens/onboarding/onboarding.dart';
import 'package:google_test_app/presentation/screens/splash/splash.dart';

class Pages {
  static final routes = [
    GetPage(name: PagesPath.SPLASH, page: () => Splash()),
    GetPage(name: PagesPath.ONBOARDING, page: () => Onboarding()),
  ];
}
