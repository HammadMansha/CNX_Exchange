import 'dart:convert';
import 'dart:io';

import 'package:gnx_exchange/classes/abstract_classes/localstorage_abstract.dart';
import 'package:gnx_exchange/utils/libraries/app_libraries.dart';
import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController with InitializeLocalStorage{
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController referralID = TextEditingController();
  bool secureText = true;
  bool isChecked = false;
  bool isReferralShow = false;
  bool isNormalSelect = true;
  bool isPhoneSelected = false;
  bool isLoading = false;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  String ipAddress = "";

  final TradeScreenController tradeController=Get.put(TradeScreenController());
  final LandingScreenController landController=Get.find<LandingScreenController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    ipAddress = await getIPAddress();
    print('Local IP Address: $ipAddress');
  }

  //------------------------------Find IP address--------------------
  Future<String> getIPAddress() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        // Check for non-loopback IPv4 addresses
        if (addr.type == InternetAddressType.IPv4 &&
            !addr.address.startsWith('127.')) {
          return addr.address;
        }
      }
    }
    return 'No IP address found';
  }

  //----------------------------Login user API call----------------

  Future<void> loginUser() async {
    try {
      isLoading = true;
      update();
      var url = Uri.parse('${ApiData.baseUrl}${ApiData.loginUser}');
      if (kDebugMode) {
        print("Login request------------$url");
      }
      var res = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email.text,
          "password": password.text,
          "IpAddress": ipAddress,
        }),
      );
      var data = json.decode(res.body);
      String resultMessage = data["data"]["result"];

      if (kDebugMode) {
        print("Response status code---------------${res.statusCode}");
        print("Response body---------------$data");
      }
      if (resultMessage.toString().contains("Successfull")) {
        //Get.back();
        isLoading = false;
        await storage.write("isAppOpen", 'true');
        await storage.write("uid_out", '${data["data"]["uid_output"]}');
        tradeController.updateData(true);
        landController.updateLoginStatus(true);

        update();
        Get.offAll(DashboardScreen());
        ShowToastMessage(
          AppStrings.loginSuccess,
        );
      } else if (resultMessage.toString().contains("Wrong password")) {
        isLoading = false;
        update();
        ShowToastMessage(
          AppStrings.incorrectUsername,
        );
      } else {
        isLoading = false;
        update();
        ShowToastMessage(
          AppStrings.somethingWentWrong,
        );
      }
    } catch (e) {
      isLoading = false;
      update();

      ShowToastMessage(
        AppStrings.somethingWentWrong,
      );
    }
  }
}
