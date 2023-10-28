import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

import '../middlewear/auth/auth_middlewear.dart';

class AppPages {
  static var initial = Routes.dashboardScreen;
  static final routes = [
    //----------------------Landing Screen------------------
    GetPage(
      name: Routes.landingScreen,
      page: () => LandingScreen(),
    ),
    //----------------------Login screen route------------------
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),
    //----------------------Login screen route------------------

    GetPage(
      name: Routes.registrationScreen,
      page: () => RegistrationScreen(),
    ),

    //----------------------verify otp route------------------

    GetPage(
      name: Routes.verifyOtpScreen,
      page: () => VerifyOtpScreen(),
    ),

    //----------------------dashboard screen route------------------

    GetPage(
      name: Routes.dashboardScreen,
      page: () => DashboardScreen(),
    ),

    //----------------------Trade screen route------------------

    GetPage(
      name: Routes.tradeScreen,
      page: () => const TradeScreen(),
    ),

    //----------------------Market screen route------------------

    GetPage(
      name: Routes.marketScreen,
      page: () => const MarketScreen(),
    ),

    //----------------------Market screen route------------------

    GetPage(
      name: Routes.avaxUsdtScreen,
      page: () => const AvaxUSDTScreen(),
    ),
  ];
}
