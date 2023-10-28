import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

class AuthMiddleware extends GetMiddleware {
  AuthService authService = Get.find<AuthService>();
  @override
  RouteSettings? redirect(String? route) {
    return authService.loggedInUser
        ? null
        : const RouteSettings(name: Routes.dashboardScreen);
  }
}
