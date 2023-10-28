import 'package:gnx_exchange/controller/market_screen_controller/market_screen_controller.dart';
import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: bodyData(context),
    ));
  }

  bodyData(BuildContext context) {
    MarketScreenController controller = Get.put(MarketScreenController());
    return Container(
      height: Get.height,
      width: Get.width,
      color: AppColors.backgroundColor,
      child: Obx(
        () => (controller.searchFiledPress.value == false)
            //-----------------------If search bar not pressed area----------------

            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //--------------------Search bar row-----------------------

                  SizedBox(
                    height: 35,
                    child: CommonTextField(

                      controller: controller.searchController,
                      fillcolor: AppColors.textFieldFillColor,
                      radius: 20,
                      prefixIcon: Icons.search,
                      hintText: "Search coin",
                      onChanged: (value) {
                        controller.search(value);
                      },
                      onTap: () {
                        if(controller.topRatedSearch.isEmpty) {
                          for (int i = 0; i < 10; i++) {
                            controller.topRatedSearch.add(controller
                                .landingScreenController.liveCoinsData[i]);
                          }
                        }
                        print("top rated coin lenght-----------${controller.topRatedSearch.length}");

                        controller.searchFiledPress.value = true;
                        if(controller.topRatedSearch.isEmpty){
                          controller.onReady();

                        }
                      },
                    ),
                  ).marginOnly(top: 10),

                  //------------------On press search container---------------

                  //----------------------Favorites and tab bar-----------
                  Obx(
                    () => Row(
                      children: [
                        InkWell(
                          hoverColor: Colors.grey,


                          onTap: () {
                            controller.selectedTab.value = "Favorites";
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border(
                                top: const BorderSide(
                                  color: Colors.transparent,
                                ),
                                left:
                                    const BorderSide(color: Colors.transparent),
                                right:
                                    const BorderSide(color: Colors.transparent),
                                bottom: BorderSide(
                                    color: controller.selectedTab.value ==
                                            'Favorites'
                                        ? Colors.amber
                                        : Colors.transparent,
                                    width: 2),
                              ),
                            ),
                            child: const Text(
                              "Favorites",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ).marginOnly(left: 6, right: 27),
                        InkWell(
                          hoverColor: Colors.grey,
                          onTap: () {
                            controller.selectedTab.value = "Spot";
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border(
                                top: const BorderSide(
                                  color: Colors.transparent,
                                ),
                                left:
                                    const BorderSide(color: Colors.transparent),
                                right:
                                    const BorderSide(color: Colors.transparent),
                                bottom: BorderSide(
                                    color:
                                        controller.selectedTab.value == 'Spot'
                                            ? Colors.amber
                                            : Colors.transparent,
                                    width: 2),
                              ),
                            ),
                            child: const Text(
                              "Spot",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ).marginOnly(left: 6, right: 27),
                      ],
                    ),
                  ).marginOnly(top: 10),

                  //-------------------------------Favorites and future buttons tabs----------
                  Obx(
                    () => controller.selectedTab.value == "Favorites"
                        ? Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.selectedContainer.value = "Spot";
                                },
                                child: Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.selectedContainer.value ==
                                                  "Spot"
                                              ? AppColors.textFieldFillColor
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "Spot",
                                      style:
                                          CommonTextStyle.font12weight500white,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.selectedContainer.value = "Future";
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.selectedContainer.value ==
                                                  "Future"
                                              ? AppColors.textFieldFillColor
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "Future",
                                      style:
                                          CommonTextStyle.font12weight500white,
                                    ),
                                  ),
                                ).marginOnly(left: 10),
                              ),
                              const Spacer(),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.textFieldFillColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.cable,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.textFieldFillColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.edit_calendar_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ).marginOnly(top: 10)
                        :
                        //------------------Row for usdt, btc, and eth------------------
                        Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.spotSelectedContainer.value =
                                      "USDT";
                                },
                                child: Container(
                                  height: 35,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: controller.spotSelectedContainer
                                                  .value ==
                                              "USDT"
                                          ? AppColors.textFieldFillColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "USDT",
                                      style:
                                          CommonTextStyle.font12weight500white,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.spotSelectedContainer.value =
                                      "BTC";
                                },
                                child: Container(
                                  height: 35,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: controller.spotSelectedContainer
                                                  .value ==
                                              "BTC"
                                          ? AppColors.textFieldFillColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "BTC",
                                      style:
                                          CommonTextStyle.font12weight500white,
                                    ),
                                  ),
                                ).marginOnly(left: 10),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.spotSelectedContainer.value =
                                      "ETH";
                                },
                                child: Container(
                                  height: 35,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      color: controller.spotSelectedContainer
                                                  .value ==
                                              "ETH"
                                          ? AppColors.textFieldFillColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "ETH",
                                      style:
                                          CommonTextStyle.font12weight500white,
                                    ),
                                  ),
                                ).marginOnly(left: 10),
                              ),
                              const Spacer(),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.textFieldFillColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.cable,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ).marginOnly(top: 10),
                  ),
                  //----------------------------Name, last price and Chg row-----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: CommonTextStyle.font13weight700white,
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          Text(
                            "Vol",
                            style: CommonTextStyle.font13weight700white,
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Price",
                            style: CommonTextStyle.font13weight700white,
                          ).marginOnly(top: 5),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Chg%",
                            style: CommonTextStyle.font13weight700white,
                          ).marginOnly(top: 5),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ).marginSymmetric(vertical: 5),

                  Expanded(
                    child: Obx(
                      () => controller.selectedTab.value == "Favorites" &&
                              controller.selectedContainer.value == "Spot"
                          ? favouriteSpotContainer(controller)
                          // : controller.selectedTab.value == "Favorites" && controller.selectedContainer.value == "Future"
                          //     ? futureContainer(controller)
                              : controller.selectedTab.value == "Spot" &&
                                      controller.spotSelectedContainer.value ==
                                          "USDT"
                                  ? usdtContainer(controller)
                                  : controller.selectedTab.value == "Spot" &&
                                          controller.spotSelectedContainer
                                                  .value ==
                                              "BTC"
                                      ? btcContainer(controller)
                                      : controller.selectedTab.value ==
                                                  "Spot" &&
                                              controller.spotSelectedContainer
                                                      .value ==
                                                  "ETH"
                                          ? ethContainer(controller)
                                          : const SizedBox(),
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 15)

            //-----------------------If search bar  pressed area----------------
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            controller.searchFiledPress.value = false;
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ).marginOnly(top: 10, right: 10)),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: CommonTextField(
                            autoFocus: true,

                            controller: controller.searchController,
                            fillcolor: AppColors.textFieldFillColor,
                            radius: 20,
                            prefixIcon: Icons.search,
                            hintText: "Search coin",
                            onChanged: (value) {
                              controller.search(value);
                            },
                            onTap: () {
                              controller.searchFiledPress.value = true;
                            },
                          ),
                        ).marginOnly(top: 10),
                      ),
                      InkWell(
                          onTap: () {
                            controller.searchFiledPress.value = false;
                          },
                          child: Text(
                            "Cancel",
                            style: CommonTextStyle.font12weight500white,
                          ).marginOnly(top: 10, left: 10))
                    ],
                  ).marginSymmetric(horizontal: 15),
                  controller.searchHistory.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search History",
                              style: CommonTextStyle.font20weight700white,
                            ).marginSymmetric(horizontal: 20, vertical: 10),
                            InkWell(
                                onTap: () {
                                  controller.searchHistory.clear();
                                },
                                child: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.grey,
                                ).marginOnly(right: 10))
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: Get.width, // Adjust this as needed
                    child: Wrap(
                      children: controller.searchHistory.map((item) {
                        // Calculate the height and width based on your data
                        final containerHeight = 50.0;
                        final containerWidth = 90.0;

                        return Container(
                          width: containerWidth,
                          height: containerHeight,
                          margin: const EdgeInsets.all(
                              4.0), // Adjust margin as needed
                          color: Colors
                              .grey.shade900, // You can set any color you want
                          child: Center(
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ).marginSymmetric(horizontal: 10),
                  Text(
                    "Top Search",
                    style: CommonTextStyle.font20weight700white,
                  ).marginSymmetric(horizontal: 20, vertical: 10),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Obx(
                      () {
                        final searchResult = controller.searchResult;
                        return searchResult.isEmpty
                            ? ListView.builder(
                                itemCount: controller.topRatedSearch.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: ()async {

                                          print("top rated coin name-------------${controller.topRatedSearch[index]}");
                                           FocusScope.of(context).unfocus();
                                          Get.toNamed(Routes.avaxUsdtScreen,arguments: {
                                            "coin_name":controller.topRatedSearch[index]["s"],
                                            "rate":controller.topRatedSearch[index]["p"],
                                          });

                                          controller.checkSearchAlreadyExist(
                                              controller.topRatedSearch[index]["s"]);
                                          if (controller.searchAlreadyAvailable
                                                  .value !=
                                              true) {
                                            controller.searchHistory.add(
                                                controller
                                                    .topRatedSearch[index]["s"]);
                                          }
                                          print(
                                              "From Top rated search history list---------${controller.searchHistory}");
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  controller.topRatedSearch[index]["s"],
                                                  style: CommonTextStyle
                                                      .font13weight700white,
                                                ),

                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                Text(controller.landingScreenController.liveCoinsData[index]["c"],

                                                  style: CommonTextStyle
                                                      .font13weight700white,
                                                ),
                                                Text(
                                                  "${controller.landingScreenController.liveCoinsData[index]["p"]}",
                                                  style: controller
                                                      .landingScreenController.liveCoinsData[index]["p"]
                                                      .toString()
                                                      .contains("-")
                                                      ?    CommonTextStyle
                                                      .font10weight700red
                                                      : CommonTextStyle
                                                      .font10weight700green



                                                ),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.star_border,
                                              color: Colors.grey,
                                            ).marginOnly(left: 5),
                                          ],
                                        ).marginSymmetric(vertical: 10),
                                      ),
                                    ],
                                  );
                                },
                              ).marginSymmetric(horizontal: 20)
                            : ListView.builder(
                                itemCount: searchResult.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          print("top rated coin name-------------${controller.topRatedSearch[index]}");
                                          FocusScope.of(context).unfocus();
                                          Get.toNamed(Routes.avaxUsdtScreen,arguments: {
                                            "coin_name":controller.topRatedSearch[index]["s"],
                                            "rate":controller.topRatedSearch[index]["p"],


                                          });

                                          controller.checkSearchAlreadyExist(
                                              controller.searchResult[index]);
                                          if (controller.searchAlreadyAvailable
                                                  .value !=
                                              true) {
                                            controller.searchHistory.add(
                                                controller.searchResult[index]);
                                          }
                                          Get.toNamed(Routes.avaxUsdtScreen);

                                          print(
                                              "From Search result  history list---------${controller.searchHistory}");
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  controller
                                                      .searchResult[index]["s"],
                                                  style: CommonTextStyle
                                                      .font13weight700white,
                                                ),

                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                Text(
                                                  double.parse( controller.landingScreenController.liveCoinsData[index]["c"])
                                                      .toStringAsFixed(2),
                                                  style: CommonTextStyle
                                                      .font13weight700white,
                                                ),


                                                Text(
                                                  "${double.parse(controller.landingScreenController.liveCoinsData[index]["p"]).toStringAsFixed(2)}%",

                                                  style:controller.landingScreenController.liveCoinsData[index]["p"].contains("-")?CommonTextStyle.font10weight700red:
                                                  CommonTextStyle
                                                      .font10weight700green,
                                                ),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.star_border,
                                              color: Colors.grey,
                                            ).marginOnly(left: 5),
                                          ],
                                        ).marginSymmetric(vertical: 10),
                                      ),
                                    ],
                                  );
                                },
                              ).marginSymmetric(horizontal: 20);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget futureContainer(MarketScreenController controller) {
    return SizedBox(
      child: Column(
        children: [
          //-------------------------------Spot row , last price row-------------------------
          //
          // SizedBox(
          //   height: 100,
          //   width: 100,
          //   child: Image.asset(AppAssets.favorite),
          // ),

          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Icon(
          //       Icons.add_circle_outline,
          //       color: Colors.grey,
          //       size: 20,
          //     ),
          //     CommonSpaces.spaceHorizontal5,
          //     Text(
          //       "Add Favorites",
          //       style: CommonTextStyle.font13weight700white,
          //     ),
          //   ],
          // ).marginSymmetric(vertical: 10),
          SizedBox(
            height: Get.height / 2.7,
            width: Get.width,
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: 60,
                        width: Get.width / 2.35,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              controller.topRatedSearch[index]["coin_name"],
                              style: CommonTextStyle.font13weight700white,
                            ),
                            Text(
                              "/USDT",
                              style: CommonTextStyle.font10weight500white,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.done,
                              color: AppColors.yellowIconsColor,
                            ),
                          ],
                        ).marginSymmetric(horizontal: 10),
                      ),
                      const Spacer(),
                      Container(
                        height: 60,
                        width: Get.width / 2.35,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              controller.topRatedSearch[index + 1]["coin_name"],
                              style: CommonTextStyle.font13weight700white,
                            ),
                            Text(
                              "/USDT",
                              style: CommonTextStyle.font10weight500white,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.done,
                              color: AppColors.yellowIconsColor,
                            ),
                          ],
                        ).marginSymmetric(horizontal: 10),
                      ),
                    ],
                  ).marginSymmetric(vertical: 5);
                }),
          ),

          //-----------------------Add favorite button-----------------------

          const SizedBox(
            height: 40,
          ),
          CommonButton(
              width: Get.width / 1.3,
              text: "Add Favorite",
              textStyle: CommonTextStyle.font10weight500black,
              onPressed: () {},
              fillColor: AppColors.buttonColor),

          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget favouriteSpotContainer(MarketScreenController controller) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: Colors.grey.shade700,
                ),
                bottom: BorderSide(
                  color: Colors.grey.shade700,
                )),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //-------------------------------Spot row , last price row-------------------------

              controller.favoritesCoins.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.find_in_page,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            "No coins found",
                            style: CommonTextStyle.font13weight700white,
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: controller.favoritesCoins.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                InkWell(
                                hoverColor:Colors.grey,
                                highlightColor:Colors.black,
                                  focusColor: Colors.grey,


                                  onTap: () {
                                    Get.toNamed(Routes.avaxUsdtScreen,
                                        arguments: {
                                          "coin_name":
                                              controller.favoritesCoins[index]
                                                  ["coin_name"],
                                          "rate":controller.favoritesCoins[index]["p"],

                                        });
                                  },

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.favoritesCoins[index]
                                                ["coin_name"],
                                            style: CommonTextStyle
                                                .font13weight700white,
                                          ),

                                        ],
                                      ),
                                      Text(
                                        double.parse( controller.favoritesCoins[index]["latestRate"])
                                            .toStringAsFixed(2),
                                        style: CommonTextStyle
                                            .font13weight700white,
                                      ).marginOnly(left: 45),


                                      CommonButton(
                                          height: 30,
                                          width: 86,
                                          text: double.parse(controller.favoritesCoins[index]["change"]).toStringAsFixed(2),


                                          textStyle: CommonTextStyle
                                              .font10weight500white,
                                          onPressed: () {},
                                          fillColor: controller
                                                  .favoritesCoins[index]
                                                      ["change"]
                                                  .toString()
                                                  .contains("-")
                                              ? AppColors.redButton
                                              : AppColors.greenButton),
                                    ],
                                  ).marginSymmetric(vertical: 10),
                                ),

                              ],
                            );
                          }),
                    ),
            ],
          ).marginSymmetric(horizontal: 10, vertical: 5),
        ));
  }

  Widget usdtContainer(MarketScreenController controller) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: Colors.grey.shade700,
                ),
                bottom: BorderSide(
                  color: Colors.grey.shade700,
                )),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //-------------------------------Spot row , last price row-------------------------

              controller.landingScreenController.liveCoinsData.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.find_in_page,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            "No coins found",
                            style: CommonTextStyle.font13weight700white,
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: controller.landingScreenController.liveCoinsData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Material(
                                  color:AppColors.backgroundColor,


                                  child: InkWell(
                                  highlightColor:Colors.grey,

                                    onLongPress: () {
                                      showAddFavoriteDialog(
                                          context,
                                          controller.landingScreenController.liveCoinsData[index],
                                          controller);

                                      controller.isShowMessage.value = true;
                                    },
                                    onTap: () {
                                      Get.toNamed(Routes.avaxUsdtScreen,
                                          arguments: {
                                            "coin_name": controller
                                                .landingScreenController.liveCoinsData[index]["s"],
                                            "rate":controller.landingScreenController.liveCoinsData[index]["p"]
                                          });
                                    },
                                    
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              controller.landingScreenController.liveCoinsData[index]
                                                  ["s"],
                                              style: CommonTextStyle
                                                  .font13weight700white,
                                            ),

                                          ],
                                        ),
                                        Text(
                                          double.parse( controller.landingScreenController.liveCoinsData[index]["c"])
                                              .toStringAsFixed(2),
                                          style: CommonTextStyle
                                              .font13weight700white,
                                        ).marginOnly(left: 30),
                                        CommonButton(
                                            height: 30,
                                            width: 90,
                                            text:
                                            "${double.parse(controller.landingScreenController.liveCoinsData[index]["p"]).toStringAsFixed(2)}%",
                                            textStyle: CommonTextStyle
                                                .font10weight500white,
                                            onPressed: () {},
                                            fillColor: controller
                                                    .landingScreenController.liveCoinsData[index]["p"]
                                                    .toString()
                                                    .contains("-")
                                                ? AppColors.redButton
                                                : AppColors.greenButton),
                                      ],
                                    ).marginSymmetric(vertical: 10),
                                  ),
                                ),

                              ],
                            );
                          }),
                    ),
            ],
          ).marginSymmetric(horizontal: 10, vertical: 5),
        ));
  }

  Widget btcContainer(MarketScreenController controller) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
              color: Colors.grey.shade700,
            ),
            bottom: BorderSide(
              color: Colors.grey.shade700,
            )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //-------------------------------Spot row , last price row-------------------------

          controller.landingScreenController.btcCoins.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.find_in_page,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "No coins found",
                  style: CommonTextStyle.font13weight700white,
                ),
              ],
            ),
          )
              : Expanded(
            child: ListView.builder(
                itemCount: controller.landingScreenController.btcCoins.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Material(
                        color:AppColors.backgroundColor,


                        child: InkWell(
                          highlightColor:Colors.grey,

                          onLongPress: () {
                            showAddFavoriteDialog(
                                context,
                                controller.landingScreenController.btcCoins[index],
                                controller);

                            controller.isShowMessage.value = true;
                          },
                          onTap: () {
                            Get.toNamed(Routes.avaxUsdtScreen,
                                arguments: {
                                  "coin_name": controller
                                      .landingScreenController.btcCoins[index]["s"],
                                  "rate":controller.landingScreenController.btcCoins[index]["p"]
                                });
                          },

                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    controller.landingScreenController.btcCoins[index]
                                    ["s"],
                                    style: CommonTextStyle
                                        .font13weight700white,
                                  ),

                                ],
                              ),
                              Text(
                                double.parse( controller.landingScreenController.btcCoins[index]["c"])
                                    .toStringAsFixed(2),
                                style: CommonTextStyle
                                    .font13weight700white,
                              ).marginOnly(left: 30),
                              CommonButton(
                                  height: 30,
                                  width: 90,
                                  text:
                                  "${double.parse(controller.landingScreenController.btcCoins[index]["p"]).toStringAsFixed(2)}%",
                                  textStyle: CommonTextStyle
                                      .font10weight500white,
                                  onPressed: () {},
                                  fillColor: controller
                                      .landingScreenController.btcCoins[index]["p"]
                                      .toString()
                                      .contains("-")
                                      ? AppColors.redButton
                                      : AppColors.greenButton),
                            ],
                          ).marginSymmetric(vertical: 10),
                        ),
                      ),

                    ],
                  );
                }),
          ),
        ],
      ).marginSymmetric(horizontal: 10, vertical: 5),
    ));
  }

  Widget ethContainer(MarketScreenController controller) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
              color: Colors.grey.shade700,
            ),
            bottom: BorderSide(
              color: Colors.grey.shade700,
            )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //-------------------------------Spot row , last price row-------------------------

          controller.landingScreenController.ethCoins.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.find_in_page,
                  size: 50,
                  color: Colors.white,
                ),
                Text(
                  "No coins found",
                  style: CommonTextStyle.font13weight700white,
                ),
              ],
            ),
          )
              : Expanded(
            child: ListView.builder(
                itemCount: controller.landingScreenController.ethCoins.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Material(
                        color:AppColors.backgroundColor,


                        child: InkWell(
                          highlightColor:Colors.grey,

                          onLongPress: () {
                            showAddFavoriteDialog(
                                context,
                                controller.landingScreenController.ethCoins[index],
                                controller);

                            controller.isShowMessage.value = true;
                          },
                          onTap: () {
                            Get.toNamed(Routes.avaxUsdtScreen,
                                arguments: {
                                  "coin_name": controller
                                      .landingScreenController.ethCoins[index]["s"],
                                  "rate":controller.landingScreenController.ethCoins[index]["p"]
                                });
                          },

                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    controller.landingScreenController.ethCoins[index]
                                    ["s"],
                                    style: CommonTextStyle
                                        .font13weight700white,
                                  ),

                                ],
                              ),
                              Text(
                                double.parse( controller.landingScreenController.ethCoins[index]["c"])
                                    .toStringAsFixed(2),
                                style: CommonTextStyle
                                    .font13weight700white,
                              ).marginOnly(left: 30),
                              CommonButton(
                                  height: 30,
                                  width: 90,
                                  text:
                                  "${double.parse(controller.landingScreenController.ethCoins[index]["p"]).toStringAsFixed(2)}%",
                                  textStyle: CommonTextStyle
                                      .font10weight500white,
                                  onPressed: () {},
                                  fillColor: controller
                                      .landingScreenController.ethCoins[index]["p"]
                                      .toString()
                                      .contains("-")
                                      ? AppColors.redButton
                                      : AppColors.greenButton),
                            ],
                          ).marginSymmetric(vertical: 10),
                        ),
                      ),

                    ],
                  );
                }),
          ),
        ],
      ).marginSymmetric(horizontal: 10, vertical: 5),
    ));
  }

  void showAddFavoriteDialog(
      BuildContext context, Map coinData, MarketScreenController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.blackColor,
          title: Text(
            'Add Favorite',
            style: CommonTextStyle.font20weight700white,
          ),
          content: Text('Do you want to add this coin to favorites?',
              style: CommonTextStyle.font13weight700white),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add favorite logic here
                // Convert numerical values to strings with 4 decimal places
                bool? checkCoinExistance =
                    controller.checkCoinAlreadyExist(coinData["s"]);
                if (checkCoinExistance == true) {
                  Navigator.of(context).pop();

                  ShowToastMessage("Coin already available in favorites");
                } else {
                  controller.favoritesCoins.add({
                    "coin_name": coinData["s"],
                    "latestRate": coinData["c"],
                    "change": coinData["p"],
                  });

                  print(
                      "Data added successfully in favorite list ${controller.favoritesCoins}");

                  Navigator.of(context).pop();
                }

// Close the dialog
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
