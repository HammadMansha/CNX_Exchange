import 'dart:convert';

import 'package:gnx_exchange/utils/libraries/app_libraries.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../classes/abstract_classes/localstorage_abstract.dart';
import '../market_screen_controller/market_screen_controller.dart';

class LandingScreenController extends GetxController
    with InitializeLocalStorage {
  CarouselController? carouselController;
  late int selectedPage;
  final PageController pageController = PageController();
  final int numPages = 10; // Total number of icons
  late final PageController _pageController;
  int pageCount = 5;
  RxString selectedTab = "Favorites".obs;
  RxBool isUserLogin = false.obs;

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

  List icons = [
    AppAssets.superStart,
    AppAssets.spot,
    AppAssets.misteryBox,
    AppAssets.chat,
    AppAssets.usdt,
    AppAssets.p2p,
    AppAssets.referral,
    AppAssets.academy,
    AppAssets.referral,
    AppAssets.academy,
    AppAssets.transfer,
    AppAssets.orders,
    AppAssets.chat,
    AppAssets.spot,
    AppAssets.futures,
    AppAssets.help,
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

  final int imagesPerPage = 8;
  var currentPage = 0.0.obs;
  WebSocketChannel? channel;
  RxList liveCoinsData = [].obs;
  RxList btcCoins = [].obs;
  RxList ethCoins = [].obs;

  RxList tempCoins = [].obs;
  RxList loserCoinList = [].obs;
  RxList gainerCoinList = [].obs;
  String targetCurrency = "USDT";


  final List targetCoins = [
    "BTC",
    "ETH",
    "BNB",
    "NEO",
    "DOT",
    "LTC",
    "QTUM",
    "ADA",
    "XRP",
    "EOS",
    "TUSD",
    "IOTA",
    "XLM",
    "ONT",
    "TRX",
    "ETC",
    "ICX",
    "NULS",
    "VET",
    "USDC",
    "LINK",
    "WAVES",
    "ONG",
    "HOT",
    "ZIL",
    "ZRX",
    "FET",
    "BAT",
    "XMR",
    "ZEC",
    "IOST",
    "CELR",
    "DASH",
    "OMG",
    "THETA",
    "ENJ",
    "MATIC",
    "ATOM",
    "TFUEL",
    "ONE",
    "FTM",
    "ALGO",
    "DOGE",
    "DUSK",
    "ANKR",
    "WIN",
    "COS",
    "MTL",
    "TOMO",
    "PERL",
    "DENT",
    "KEY",
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    pageController.addListener(() {
      currentPage.value = pageController.page ?? 0;
    });
    if (storage.hasData("isAppOpen")) {
      isUserLogin.value = true;
    } else {
      isUserLogin.value = false;
    }
    connectToWebSocket();

    update();

    super.onInit();
  }

  void updateLoginStatus(bool newData) {
    isUserLogin.value = newData;
    update();
  }

  void connectToWebSocket() {
    // Replace this URL with your WebSocket URL
    channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/!ticker@arr'),
    );

    // Listen to WebSocket data
    channel!.stream.listen((data) {
      // Handle WebSocket data here
      List<dynamic> jsonData = jsonDecode(data);

      for (var element in targetCoins) {
        for (var mapCoins in jsonData) {
          if (element + targetCurrency == mapCoins['s']) {
            bool found =
                false; // To track whether the element is already in liveCoinsData
            if (liveCoinsData.isEmpty) {
              liveCoinsData.add(mapCoins);
            } else {
              for (int i = 0; i < liveCoinsData.length; i++) {
                if (liveCoinsData[i]["s"] == mapCoins["s"]) {
                  liveCoinsData[i] = mapCoins;
                  found = true;

                  break; // Exit the loop since we found a match
                }
              }
              if (!found) {
                liveCoinsData
                    .add(mapCoins); // Add the element if it wasn't found
              }
            }
          }
          else  if (element + "BTC" == mapCoins['s']) {
            bool found =
            false; // To track whether the element is already in liveCoinsData
            if (btcCoins.isEmpty) {
              btcCoins.add(mapCoins);
            } else {
              for (int i = 0; i < btcCoins.length; i++) {
                if (btcCoins[i]["s"] == mapCoins["s"]) {
                  btcCoins[i] = mapCoins;
                  found = true;

                  break; // Exit the loop since we found a match
                }
              }
              if (!found) {
                btcCoins
                    .add(mapCoins); // Add the element if it wasn't found
              }
            }
          }
          else  if (element + "ETH" == mapCoins['s']) {
            bool found =
            false; // To track whether the element is already in liveCoinsData
            if (ethCoins.isEmpty) {
              ethCoins.add(mapCoins);
            } else {
              for (int i = 0; i < ethCoins.length; i++) {
                if (ethCoins[i]["s"] == mapCoins["s"]) {
                  ethCoins[i] = mapCoins;
                  found = true;

                  break; // Exit the loop since we found a match
                }
              }
              if (!found) {
                ethCoins
                    .add(mapCoins); // Add the element if it wasn't found
              }
            }
          }



        }
      }


      liveCoinsData.forEach((element) {
        if (element["p"].toString().contains("-")) {
          if (loserCoinList.isEmpty) {
            loserCoinList.add(element);
          } else {
            bool isLoserExist = false;
            for (int i = 0; i < loserCoinList.length; i++) {
              if (loserCoinList[i]["s"] == element["s"]) {
                loserCoinList[i] = element;
                isLoserExist = true;
                break; // Exit the loop since we found a match
              }
            }
            if (!isLoserExist) {
              loserCoinList.add(element); // Add the element if it wasn't found
            }
          }
        } else {
          if (gainerCoinList.isEmpty) {
            gainerCoinList.add(element);
          } else {
            bool isGainerExist = false;
            for (int i = 0; i < gainerCoinList.length; i++) {
              if (gainerCoinList[i]["s"] == element["s"]) {
                gainerCoinList[i] = element;
                isGainerExist = true;
                break; // Exit the loop since we found a match
              }
            }
            if (!isGainerExist) {
              gainerCoinList.add(element); // Add the element if it wasn't found
            }
          }
        }
      });

    });
  }

  void disconnectWebSocket() {
    channel?.sink.close();
  }
}
