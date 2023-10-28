import 'dart:convert';
import 'package:gnx_exchange/utils/libraries/app_libraries.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/common_snackbar/common_snackbar.dart';

class RegistrationScreenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController referralID = TextEditingController();
  bool secureText = true;
  bool isChecked = false;
  bool isReferralShow = false;
  bool isPhoneSelected = false;
  bool isLoading = false;
  String resultString = "";
  bool isReferralIdValid = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //---------------------Register user------------------------

  Future<void> registerUser() async {
    try {
      isLoading = true;
      update();
      var url = Uri.parse('${ApiData.baseUrl}${ApiData.registerUser}');
      if (kDebugMode) {
        print("Register request------------$url");
      }
      var res = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            "sponser_id": referralID.text.isEmpty?"456677":referralID.text,
            "name": "Cnx default",
            "email": email.text,
            "mobile": "",
            "password": password.text,
            "countrycode": "IN",
            "countryname": "🇮🇳 India"
          },
        ),
      );
      var data = json.decode(res.body);
      String resultMessage = "";
      print("i am here--------------${res.body}");

      resultMessage = data["data"]["result"];

      if (kDebugMode) {
        print("Response status code---------------${res.statusCode}");
        print("Response body---------------$data");
      }
      if (resultMessage.contains("Successfull") ||
          resultMessage.contains("Invalid Sponser Id")) {
        Get.toNamed(Routes.verifyOtpScreen, arguments: {
          "referralID": referralID.text,
          "email": email.text,
          "password": password.text,
        });
        isLoading = false;
        update();

        ShowToastMessage(AppStrings.success);

      } else if(resultString.contains("Sponser Id does not exists..")){
        isLoading = false;
        update();
        ShowToastMessage(AppStrings.referralIdNotExist);

      }

      else if (resultMessage.contains("Email Already EXISTS ")) {
        isLoading = false;
        update();

        ShowToastMessage(AppStrings.userAlreadyRegistered);

      }
      else{
        isLoading = false;
        update();
       ShowToastMessage(AppStrings.somethingWentWrong);
      }
    } catch (e) {
      isLoading = false;
      update();


      ShowToastMessage(AppStrings.somethingWentWrong);

    }
  }

//---------------------verify sponsor  ID ---------------------

  Future<void> verifySponsorId() async {
    try {
      isLoading = true;
      update();

      var url = Uri.parse('${ApiData.baseUrl}${ApiData.verifySponserID}');
      if (kDebugMode) {
        print("Sponsor request------------$url");
      }
      var res = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "uid": referralID.text,
        }),
      );
      var data = json.decode(res.body);

      resultString = data["data"]["result"];
      if (kDebugMode) {
        print("Response status code---------------${res.statusCode}");
        print("Response body---------------$resultString");
      }
      if (resultString == "cnx") {
        isReferralIdValid = true;
        update();
      } else {
        isReferralIdValid = false;
        update();
      }

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();



      ShowToastMessage(AppStrings.somethingWentWrong);

    }
  }
}
