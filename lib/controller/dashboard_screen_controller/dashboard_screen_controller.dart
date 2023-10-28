import 'dart:collection';
import 'package:gnx_exchange/utils/libraries/app_libraries.dart';


class DashboardScreenController extends GetxController {
  ListQueue<int> navigationQueue = ListQueue();
  int currentIndex = 0;

  TradeScreenController controller =Get.put(TradeScreenController());

  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() async{
    // TODO: implement onReady

    super.onReady();
  }



//-----------------------Change bottom nav bar index----------------------
  void changeTabIndex(int index) {
    currentIndex = index;

    if (index == currentIndex) {
      navigationQueue.clear();
      // navigationQueue.removeWhere((element) => element == index);
      navigationQueue.addLast(index);
      currentIndex = index;
      update();
    }
    update();
  }
}
