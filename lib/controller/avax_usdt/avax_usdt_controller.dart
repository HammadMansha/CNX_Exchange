import 'package:gnx_exchange/utils/libraries/app_libraries.dart';


class AvaxUSDTController extends GetxController{
  String coinName="";
  RxString selectedTab="Order Book".obs;
  String coinRate='';
  TradeScreenController controller =Get.put(TradeScreenController());




  @override
  void onInit() {
    // TODO: implement onInit


    if(Get.arguments!=null){
      print("Arguments-------${Get.arguments}");


      coinName=Get.arguments["coin_name"];
      coinRate=Get.arguments["rate"];

    }
    else{
      print("no arguments-------");
    }
    super.onInit();
  }
}