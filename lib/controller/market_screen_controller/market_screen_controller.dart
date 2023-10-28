import 'dart:convert';

import 'package:gnx_exchange/utils/libraries/app_libraries.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';


class MarketScreenController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxString selectedTab = "Favorites".obs;
  RxString selectedContainer = "Spot".obs;
  RxString spotSelectedContainer = "USDT".obs;

  final searchResult = [].obs;

  RxBool searchFiledPress = false.obs;

  RxList searchHistory = [].obs;

  RxBool searchAlreadyAvailable = false.obs;

  RxBool isLoading = false.obs;
  //RxList coinsPairs = [].obs;
  RxList favoritesCoins = [].obs;
  Map favoriteCoinMap = {};
  RxBool isShowMessage = false.obs;
  LandingScreenController landingScreenController=Get.find<LandingScreenController>();

  List<Map> topRatedSearch = [];
  int counter=0;


  @override
  void onReady() async {
    // TODO: implement onReady
   // await coinsPairData();




    print("top rated list data-------------------${topRatedSearch}");
    super.onReady();
  }

  void search(String query) {

    print("Live coin data list in search-------------${landingScreenController.liveCoinsData}");

    if (query.isEmpty) {
      searchResult.assignAll([]);
      return;
    }

    final results = landingScreenController.liveCoinsData
        .where((item) => item['s'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    searchResult.assignAll(results);
  }

  void checkSearchAlreadyExist(String query) {
    searchAlreadyAvailable.value =
        searchHistory.any((item) => item.toLowerCase() == query.toLowerCase());
  }




  //------------------------Get pair of coins---------------------

  // Future<void> coinsPairData() async {
  //   try {
  //     isLoading.value = true;
  //     update();
  //     var url = Uri.parse(ApiData.coinsPair);
  //     if (kDebugMode) {
  //       print("Coins Pair request------------$url");
  //     }
  //     var res = await http.post(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     var data = json.decode(res.body);
  //     if (res.statusCode == 200) {
  //       coinsPairs.addAll(data["data"]);
  //     }
  //     isLoading.value = true;
  //   } catch (e) {
  //     isLoading.value = false;
  //
  //     Get.snackbar(
  //       AppStrings.warning,
  //       e.toString(),
  //     );
  //   }
  // }

  //------------------check coin already available in  favorite list----------------------

  bool? checkCoinAlreadyExist(String coinName) {
    for (var element in favoritesCoins) {
      if (element["coin_name"] == coinName) {
        return true;
      }
    }
    return false;
  }
}
