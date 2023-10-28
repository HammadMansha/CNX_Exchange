import 'dart:convert';
import 'dart:io';

import 'package:gnx_exchange/utils/libraries/app_libraries.dart';
import 'package:decimal/decimal.dart';

import '../../classes/abstract_classes/localstorage_abstract.dart';
import 'package:http/http.dart' as http;

class TradeScreenController extends GetxController with InitializeLocalStorage {
  String selectedTab = "Spot";
  bool buyButtonPress = true;
  List<String> priceUSDT = ["4.1195", "4.1178", "4.1177", "4.1100", "4.1162"];
  List<String> amountUSDT = ["209.55", "194.55", "169.85", "168.16", "72.17"];
  String selectedOption = "Market";
  Rx<Decimal> limitValue = Decimal.parse('4.9918').obs;
  Rx<Decimal> amountValue = Decimal.parse('0.00').obs;
  RxBool isAmountBtnPress = true.obs;
  Rx<TextEditingController> amountEt = TextEditingController().obs;
  TextEditingController totalUSDT = TextEditingController();
  double value = 40.0;
  RxBool areColumnsSwapped = true.obs;
  String bottomSelectedTab = "Open Orders";
  TextEditingController searchValue = TextEditingController();
  RxString selectDrawerTabs = "Favorites".obs;
  RxBool isLogin = false.obs;
  String uid = "";
  bool isLoading = false;
  String coinName = "";
  String coinChange="";

  List<String> hotCurrencyName = [
    "LTC",
    "BTC",
    "DOT",
    "ETH",
    "DASH",
    "EOS",
    "TOMO",
    "USDD",
    "XRP",
    "XLM"
  ];

  List<String> gainerCurrencyName = [
    "BANKB",
    "CYBER",
    "PEPEB",
    "SEI",
    "MEME",
    "MOG",
    "BOB",
    "RIBBIT",
    "FERC",
    "PIZABRC"
  ];

  List<String> loserCurrencyName = [
    "SHIA",
    "SHIB2",
    "AICOD",
    "DOGE2",
    "SYS",
    "BLUE",
    "PAYU",
    "GRV",
    "TENET",
    "DMC"
  ];
  List<String> newListingsCurrencyName = [
    "ANE",
    "AUR",
    "SULLI",
    "WILDS",
    "DNA",
    "USR",
    "WISE",
    "NYN",
    "DIFY",
    "SEIL"
  ];
  List<String> newListingsCurrencyLastPrice = [
    "0.2122",
    "0.319",
    "0.123",
    "0.0123",
    "0.01593",
    "0.0{7}57",
    "0.234",
    "0.99750",
    "0.530320",
    "0.122212"
  ];

  List<String> loserCurrencyLastPrice = [
    "7.0073",
    "11.319",
    "0.123",
    "0.0123",
    "1.01593",
    "4.0{7}57",
    "5.234",
    "0.99750",
    "0.530320",
    "0.122212"
  ];
  List<String> gainerCurrencyLastPrice = [
    "0.0073",
    "7.319",
    "9.123",
    "0.0123",
    "0.01593",
    "0.0{7}57",
    "0.234",
    "0.99750",
    "0.530320",
    "0.122212"
  ];
  List<String> hotCurrencyLastPrice = [
    "67.73",
    "27404.5",
    "4.5833",
    "1720.5",
    "27.07",
    "0.6249",
    "1.1016",
    "0.99750",
    "0.530320",
    "0.122212"
  ];

  List<String> iconsText = [
    "Super Star",
    "Deposit",
    "Mystery Box",
    "Chat",
    "1 USD",
    "P2P",
    "Referral",
    "Academy",
    "Referral",
    "Academy",
    "Transfer",
    "Orders",
    "Chat",
    "Spot Trading",
    "Futures",
    "Help Center"
  ];

  @override
  void onInit() {
    // TODO: implement onInit

    if (Get.arguments != null) {
      print("Arguments-----------------------${Get.arguments}");

      coinName = Get.arguments["coin_name"];
      coinChange=Get.arguments["rate"];
    }

    if (storage.hasData("isAppOpen")) {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
    if (storage.hasData("uid_out")) {
      uid = storage.read("uid_out");
    }

    update();
    super.onInit();
  }

  //----------------------------Swap two columns------------------
  void swapColumns() {
    areColumnsSwapped.value = !areColumnsSwapped.value;
  }

  //---------------------------increment function---------------------
  void increment() {
    limitValue.value += Decimal.parse('0.0001');
  }

  void decrement() {
    limitValue.value -= Decimal.parse('0.0001');
  }

  //-------------------------Amount increment function----------------
  void amountIncrement() {
    amountValue.value += Decimal.parse('0.01');
    amountEt.value.text = amountValue.value.toString();
  }

  void amountDecrement() {
    if (amountValue.value >= Decimal.parse('0.01')) {
      amountValue.value -= Decimal.parse('0.01');

      amountEt.value.text = amountValue.value.toString();
    } else {
      amountValue.value = Decimal.parse('0.00');
    }
  }

  void updateData(bool newData) {
    isLogin.value = newData;
  }

  void updateSelectedButton(bool newData) {
    buyButtonPress = newData;
    update();
  }

  void updateCoinName(String newData) {
    coinName = newData;
    update();
  }

  void updateChange(String newData) {
    coinChange = newData;
    update();
  }

  Future<void> buyAndSellTrade() async {
    print(
        "coin value---------$coinName Amount-----------------${amountEt.value.text}");
    if (amountEt.value.text.isEmpty) {

      ShowToastMessage("Please select amount");

    } else if (coinName.isEmpty) {

      ShowToastMessage("Please select currency type");

    } else {
      try {
        isLoading = true;
        update();
        var url = Uri.parse(
            buyButtonPress == true ? ApiData.buyTrade : ApiData.sellTrade);
        if (kDebugMode) {
          print("Buy trade  request------------$url");
        }
        var res = await http.post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              "uid": uid,
              "currencytype": coinName,
              "amount": amountEt.value.text,
              "tradetype": buyButtonPress == true ? "Buy" : "Sell",
            }));
        var data = json.decode(res.body);

        if (kDebugMode) {
          print("Response status code---------------${res.statusCode}");
          print("Response body---------------$data");
        }
        if (res.statusCode == 200) {
          //Get.back();
          isLoading = false;

          update();
          buyButtonPress == true
              ? ShowToastMessage(
                  AppStrings.coinBuySuccessfully,
                )
              : ShowToastMessage("Sell Trade successfully");

        } else if (res.statusCode == 400) {
          isLoading = false;
          update();

          ShowToastMessage(AppStrings.selectCurrencyType);
        } else {
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
  }
}
