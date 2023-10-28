import 'package:gnx_exchange/classes/abstract_classes/localstorage_abstract.dart';
import 'package:gnx_exchange/utils/libraries/app_libraries.dart';
import 'dart:io';


class DashboardScreen extends StatelessWidget with InitializeLocalStorage{
   DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardScreenController(),
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (_.navigationQueue.isEmpty) {
              return showWillPopMessage(context,_);
            }
            _.navigationQueue.removeLast();
            int position =
                _.navigationQueue.isEmpty ? 0 : _.navigationQueue.last;
            _.currentIndex = position;
            _.update();
            return false;
          },
          child: Scaffold(
            body: getBody(_),
            bottomNavigationBar: bottomNavbar(_),
          ),
        );
      },
    );
  }

  showWillPopMessage(context,DashboardScreenController _) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.blackColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          title: const Text(
            'Logout App?',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 0.4,
              fontFamily: 'Roboto',
            ),
          ),
          content: SizedBox(
            height: 100.0,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Are you sure you want to logout App?',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 0.4,
                      fontFamily: 'Roboto'),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                      onPressed: () async {
                        Get.back();
                      },
                      minWidth: Get.width / 3.5,
                      height: 48,
                      child: const Text(
                        "Cancel",
                        textScaleFactor: 1.0,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(
                          color: AppColors.backgroundColor,
                        ),
                      ),
                      onPressed: () async {
                      storage.remove("isAppOpen");
                      storage.remove("uid_out");
                      _.controller.updateData(false);

                      Get.offAll(DashboardScreen());
                      },
                      minWidth: Get.width / 3.4,
                      height: 40,
                      color: AppColors.backgroundColor,
                      child: const Text(
                        "Logout",
                        textScaleFactor: 1.0,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bottomNavbar(DashboardScreenController _) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.transparentHome),
            size: 30.0,
          ),
          label: 'Home',
          backgroundColor: AppColors.backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.transparentMarket),
            size: 30.0,
          ),
          label: 'Markets',
          backgroundColor: AppColors.backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.transparentTrade),
            size: 30.0,
          ),
          label: 'Trade',
          backgroundColor: AppColors.backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.transparentFuturess),
            size: 30.0,
          ),
          label: 'Futures',
          backgroundColor: AppColors.backgroundColor,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AppAssets.transparentWallet),
            size: 30.0,
          ),
          label: 'Wallets',
          backgroundColor: AppColors.backgroundColor,
        ),
      ],
      currentIndex: _.currentIndex,
      selectedItemColor: AppColors.yellowIconsColor,
      selectedFontSize: 12.0,
      backgroundColor: AppColors.blackColor,
      unselectedItemColor: const Color(0xffD3D3D3),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: _.changeTabIndex,
    );
  }

  Widget getBody(DashboardScreenController _) {
    List<Widget> pages = [
       LandingScreen(),
      const MarketScreen(),
      const TradeScreen(),
       LandingScreen(),
       LandingScreen(),
    ];
    return IndexedStack(
      index: _.currentIndex,
      children: pages,
    );
  }
}
