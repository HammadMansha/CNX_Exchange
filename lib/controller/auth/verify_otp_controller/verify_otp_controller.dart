import 'dart:convert';

import 'package:gnx_exchange/utils/libraries/app_libraries.dart';
import 'package:gnx_exchange/widgets/common_snackbar/common_snackbar.dart';
import 'package:http/http.dart' as http;

class VerifyOtpController extends GetxController {
  TextEditingController otpInput = TextEditingController();
  bool isLoading = false;
  RxBool isEmpty=true.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    if (Get.arguments != null) {
      if (kDebugMode) {
        print("Arguments are---------------${Get.arguments}");
      }
    }

    super.onInit();
  }

  Future<void> verifyOtp() async {
    try {
      isLoading = true;
      update();
      var url = Uri.parse('${ApiData.baseUrl}${ApiData.verifyRegisterUser}');
      if (kDebugMode) {
        print("verify register request------------$url");
      }
      var res = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            "sponser_id": Get.arguments["referralID"].toString().isEmpty?"456677":Get.arguments["referralID"],
            "name": "Cnx Default",
            "email": Get.arguments["email"],
            "mobile": "",
            "password": Get.arguments["password"],
            "countrycode": "IN",
            "countryname": "🇮🇳 India",
            "otp": otpInput.text,
          },
        ),
      );
      var data = json.decode(res.body);
      if (kDebugMode) {
        print("Response status code verify otp---------------${res.statusCode}");
        print("Response body---------------$data");
      }

      String resultMessage = data["data"]["result"];

      if (resultMessage.contains("Successfull")) {
        Get.offAll(() =>  DashboardScreen());
        isLoading = false;
        update();

        ShowToastMessage("Registration successfully");
      } else {
        isLoading = false;
        update();

        ShowToastMessage(AppStrings.warning);
      }
    } catch (e) {
      isLoading = false;
      update();

     ShowToastMessage(AppStrings.warning);
    }
  }
}
