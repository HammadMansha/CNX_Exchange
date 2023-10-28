import 'package:gnx_exchange/classes/abstract_classes/localstorage_abstract.dart';
import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  LandingScreenController controller = Get.put(LandingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: bodyData(context),
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(70.0), // Set your desired height here
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              size: 30,
            ),
          ).marginOnly(left: 10),
          title: Obx(
            () => controller.isUserLogin.value == true
                ? SizedBox()
                : GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.loginScreen);
                    },
                    child: Text(
                      AppStrings.loginOrRegister,
                      style: CommonTextStyle.font13weight700white,
                    ),
                  ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality here
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings_overscan),
              onPressed: () {
                // Implement notifications functionality here
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Implement notifications functionality here
              },
            ),
          ],
        ),
      ),
    );
  }

  bodyData(BuildContext context) {
    return GetBuilder<LandingScreenController>(
        init: LandingScreenController(),
        builder: (_) {
          final totalPageCount = (_.icons.length / 8).ceil();
          return SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //--------------------Image slider code--------------
                    CarouselSlider(
                      carouselController: _.carouselController,
                      options: CarouselOptions(
                          height: 170.0,
                          animateToClosest: true,
                          autoPlay: true,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          enlargeFactor: 0.3),
                      items: [
                        AppAssets.slider1,
                        AppAssets.slider2,
                        AppAssets.slider3,
                        AppAssets.slider4,
                        AppAssets.slider5
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(i),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    //-------------------After slider section-------------
                    Container(
                        height: Get.height / 4.5,
                        width: Get.width,
                        color: AppColors.backgroundColor,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(AppAssets.speaker),
                                ).marginSymmetric(horizontal: 15, vertical: 5),
                                // Text(
                                //   AppStrings.gnxWillSupport,
                                //   style: CommonTextStyle.font10weight500white,
                                // ),
                                SizedBox(
                                  height: 25,
                                  width: Get.width / 1.5,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      height: 15.0,
                                      autoPlayAnimationDuration:
                                          const Duration(seconds: 1),
                                      autoPlay: true,
                                      scrollDirection: Axis.vertical,
                                    ),
                                    items: [
                                      "GNX will support DORA(Dora Factory)Tok..",
                                      " SupperEX.com Super Start IEO Program",
                                      "SuperEX.com will support EDE",
                                      "EST's 1st Anniversary celebration",
                                    ].map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1.0),
                                              decoration: const BoxDecoration(
                                                  color: Colors.transparent),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      i,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: CommonTextStyle
                                                          .font10weight500white,
                                                    ),
                                                  ),
                                                ],
                                              ));
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ).marginOnly(top: 10),

                                const Spacer(),
                                const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 25,
                                ).marginOnly(right: 20),
                              ],
                            ),
                            const Divider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 100,
                              width: Get.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => Container(
                                      height: 80,
                                      width: 130,
                                      color: AppColors.blackColor,
                                      child: _.liveCoinsData.isEmpty
                                          ? const SizedBox()
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      _.liveCoinsData[index]
                                                          ["s"],
                                                      style: CommonTextStyle
                                                          .font13weight700white,
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      "${double.parse(_.liveCoinsData[index]["p"]).toStringAsFixed(2)}%",
                                                      style: _.liveCoinsData[
                                                                  index]["p"]
                                                              .toString()
                                                              .contains("-")
                                                          ? CommonTextStyle
                                                              .font13weight700red
                                                          : CommonTextStyle
                                                              .font13weight700green,
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                    double.parse(
                                                            _.liveCoinsData[
                                                                index]["c"])
                                                        .toStringAsFixed(2),
                                                    style: _.liveCoinsData[
                                                                index]["c"]
                                                            .toString()
                                                            .contains("-")
                                                        ? CommonTextStyle
                                                            .font17weight700red
                                                        : CommonTextStyle
                                                            .font17weight700green),
                                                Text(
                                                  "${double.parse(_.liveCoinsData[index]["c"]).toStringAsFixed(4)}\$",
                                                  style: CommonTextStyle
                                                      .font10weight500white,
                                                ).marginOnly(left: 5),
                                              ],
                                            ).marginSymmetric(
                                              horizontal: 5, vertical: 5),
                                    ).marginOnly(left: 10),
                                  );
                                },
                              ),
                            ),
                          ],
                        )),
                    //-----------------super wallet section--------------
                    Container(
                      height: 100,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Super Wallet",
                                      style:
                                          CommonTextStyle.font20weight700white,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text("Secure",
                                            style: CommonTextStyle
                                                .font10weight500black),
                                      ),
                                    ).marginOnly(left: 5),
                                  ],
                                ),
                                Text(
                                  "Store private key",
                                  style: CommonTextStyle.font10weight500white,
                                ),
                              ],
                            ).marginOnly(top: 15, left: 30),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(AppAssets.secure),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ).marginSymmetric(vertical: 8),
                    //-----------------Select options section-------------

                    Container(
                      height: Get.height / 4,
                      width: Get.width,
                      color: AppColors.backgroundColor,
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: _.pageController,
                              itemCount: (_.icons.length / 8)
                                  .ceil(), // 8 images per page (2 rows x 4 columns)
                              itemBuilder: (context, pageIndex) {
                                final startIndex = pageIndex * 8;
                                final endIndex = (pageIndex + 1) * 8;
                                final pageImages = _.icons.sublist(
                                  startIndex,
                                  endIndex < _.icons.length
                                      ? endIndex
                                      : _.icons.length,
                                );

                                return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 0.0,
                                    crossAxisCount: 4,
                                  ),
                                  itemCount: pageImages.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 30.0,
                                          width: 30.0,
                                          child: Image.asset(
                                            pageImages[index],
                                            fit: BoxFit.cover,
                                          ),
                                        ).marginOnly(top: 15),
                                        Text(
                                          _.iconsText[index],
                                          style: CommonTextStyle
                                              .font10weight500white,
                                        ).marginOnly(left: 15, right: 15),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Obx(
                            () => DotsIndicator(
                              dotsCount: totalPageCount,
                              position: _.currentPage.value,
                              decorator: const DotsDecorator(
                                color: Colors.grey, // Inactive dot color
                                activeColor: Colors.blue, // Active dot color
                                size: Size(8, 8), // Dot size
                                activeSize: Size(16, 8), // Active dot size
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //----------------After options selection sections------------
                    Container(
                      height: 150,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Event Center",
                                      style:
                                          CommonTextStyle.font13weight700white,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text("Hot",
                                            style: CommonTextStyle
                                                .font10weight500white),
                                      ),
                                    ).marginOnly(left: 5),
                                  ],
                                ),
                                SizedBox(
                                  height: 80,
                                  width: Get.width / 2.4,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      height: 100.0,
                                      autoPlayAnimationDuration:
                                          const Duration(seconds: 1),
                                      autoPlay: true,
                                      scrollDirection: Axis.vertical,
                                    ),
                                    items: [
                                      "Congratulations to 21****44 for acquiring 200 USDT!",
                                      "Congratulations to 24****15 for acquiring 200 USDT!",
                                      "Congratulations to 32****18 for acquiring 200 USDT!",
                                      "Congratulations to 41****67 for acquiring 200 USDT!",
                                    ].map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1.0),
                                              decoration: const BoxDecoration(
                                                  color: Colors.transparent),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    AppAssets.coin,
                                                    height: 25,
                                                    width: 25,
                                                    fit: BoxFit.contain,
                                                  ).marginSymmetric(
                                                      horizontal: 0),
                                                  Flexible(
                                                    child: Text(
                                                      i,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style: const TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ));
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ).marginOnly(top: 10),
                              ],
                            ).marginOnly(top: 15, left: 30),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets.reward),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).marginSymmetric(vertical: 8),
                    //------------------------------Tab bar container----------------------
                    Container(
                      width: Get.width,
                      color: AppColors.backgroundColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: Get.width,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  height: 50,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        const Divider(
                                      color: Colors.transparent,
                                    ),
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      //----All tab bar Container-----
                                      return Obx(
                                        () => Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _.selectedTab.value =
                                                    "Favorites";
                                              },
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border(
                                                    top: const BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                    left: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    right: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    bottom: BorderSide(
                                                        color: _.selectedTab
                                                                    .value ==
                                                                'Favorites'
                                                            ? Colors.amber
                                                            : Colors
                                                                .transparent,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Favorites",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ).marginOnly(left: 6, right: 27),
                                            GestureDetector(
                                              onTap: () {
                                                _.selectedTab.value = "Hot";
                                              },
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border(
                                                    top: const BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                    left: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    right: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    bottom: BorderSide(
                                                        color: _.selectedTab
                                                                    .value ==
                                                                'Hot'
                                                            ? Colors.amber
                                                            : Colors
                                                                .transparent,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Hot",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ).marginOnly(right: 27),
                                            GestureDetector(
                                              onTap: () {
                                                _.selectedTab.value = "Gainers";
                                              },
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border(
                                                    top: const BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                    left: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    right: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    bottom: BorderSide(
                                                        color: _.selectedTab
                                                                    .value ==
                                                                'Gainers'
                                                            ? Colors.amber
                                                            : Colors
                                                                .transparent,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Gainers",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ).marginOnly(right: 27),
                                            GestureDetector(
                                              onTap: () {
                                                _.selectedTab.value = "Losers";
                                              },
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border(
                                                    top: const BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                    left: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    right: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    bottom: BorderSide(
                                                        color: _.selectedTab
                                                                    .value ==
                                                                'Losers'
                                                            ? Colors.amber
                                                            : Colors
                                                                .transparent,
                                                        width: 2),
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Losers",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ).marginOnly(right: 27),
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     _.selectedTab.value =
                                            //         "New Listings";
                                            //   },
                                            //   child: Container(
                                            //     height: 30,
                                            //     decoration: BoxDecoration(
                                            //       color: Colors.transparent,
                                            //       border: Border(
                                            //         top: const BorderSide(
                                            //           color: Colors.transparent,
                                            //         ),
                                            //         left: const BorderSide(
                                            //             color:
                                            //                 Colors.transparent),
                                            //         right: const BorderSide(
                                            //             color:
                                            //                 Colors.transparent),
                                            //         bottom: BorderSide(
                                            //             color: _.selectedTab
                                            //                         .value ==
                                            //                     'New Listings'
                                            //                 ? Colors.amber
                                            //                 : Colors
                                            //                     .transparent,
                                            //             width: 2),
                                            //       ),
                                            //     ),
                                            //     child: const Text(
                                            //       "New Listings",
                                            //       style: TextStyle(
                                            //           fontSize: 14,
                                            //           color: Colors.grey),
                                            //     ),
                                            //   ),
                                            // ).marginOnly(right: 27),
                                          ],
                                        ).marginAll(10),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => _.selectedTab.value == "Favorites"
                                ? favoriteContainer(_)
                                : _.selectedTab.value == "Hot"
                                    ? hotContainer(_)
                                    : _.selectedTab.value == "Gainers"
                                        ? gainerContainer(_)
                                        : _.selectedTab.value == "Losers"
                                            ? losersContainer(_)
                                            // : _.selectedTab.value ==
                                            //         "New Listings"
                                            //     ? newListingsContainer(_)
                                                : const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  //-----------------------------------------Favorite container-----------------------
  Widget favoriteContainer(LandingScreenController _) {
    return Container(
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
        children: [
          //-------------------------------Spot row , last price row-------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Spot",
                    style: CommonTextStyle.font13weight700white,
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
              Text(
                "Last Price",
                style: CommonTextStyle.font13weight700white,
              ).marginOnly(top: 5),
              Text(
                "24h chg%",
                style: CommonTextStyle.font13weight700white,
              ).marginOnly(top: 5)
            ],
          ).marginSymmetric(horizontal: 15, vertical: 5),
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
                          height: 50,
                          width: Get.width / 2.25,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                _.hotCurrencyName[index],
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
                          height: 50,
                          width: Get.width / 2.25,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                _.hotCurrencyName[index + 1],
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
                    ).marginSymmetric(horizontal: 15, vertical: 5);
                  })),

          //-----------------------Add favorite button-----------------------

          CommonButton(
              width: Get.width / 1.3,
              text: "Add Favorite",
              textStyle: CommonTextStyle.font10weight500black,
              onPressed: () {},
              fillColor: AppColors.buttonColor),

          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

//-------------------------------------Hot tab bar container---------------------------
  Widget hotContainer(LandingScreenController _) {
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
            children: [
              //-------------------------------Spot row , last price row-------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: CommonTextStyle.font13weight700white,
                  ),
                  Text(
                    "Last Price",
                    style: CommonTextStyle.font13weight700white,
                  ),
                  Text(
                    "24h chg%",
                    style: CommonTextStyle.font13weight700white,
                  ),
                ],
              ),
              CommonSpaces.spaceVertical13,

              for (int index = 0; index < 10; index++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          _.liveCoinsData[index]["s"],
                          style: CommonTextStyle.font13weight700white,
                        ),
                      ],
                    ),
                    Text(
                      double.parse(_.liveCoinsData[index]["c"])
                          .toStringAsFixed(2),
                      style: CommonTextStyle.font13weight700white,
                    ),
                    CommonButton(
                        height: 30,
                        width: 85,
                        text:
                            "${double.parse(_.liveCoinsData[index]["p"]).toStringAsFixed(2)}%",
                        textStyle: CommonTextStyle.font10weight500white,
                        onPressed: () {},
                        fillColor:
                            _.liveCoinsData[index]["p"].toString().contains("-")
                                ? AppColors.redButton
                                : AppColors.greenButton),
                  ],
                ).marginSymmetric(vertical: 10),
            ],
          ).marginSymmetric(horizontal: 15, vertical: 5),
        ));
  }

  //--------------------------------Gainers container-----------------------------------
  Widget gainerContainer(LandingScreenController _) {
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
            children: [
              //-------------------------------Spot row , last price row-------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: CommonTextStyle.font13weight700white,
                  ),
                  Text(
                    "Last Price",
                    style: CommonTextStyle.font13weight700white,
                  ),
                  Text(
                    "24h chg%",
                    style: CommonTextStyle.font13weight700white,
                  ),
                ],
              ),
              CommonSpaces.spaceVertical13,

              for (int index = 0; index < _.gainerCoinList.length; index++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          _.gainerCoinList[index]["s"],
                          style: CommonTextStyle.font13weight700white,
                        ),
                      ],
                    ),
                    Text(
                      double.parse(_.gainerCoinList[index]["c"])
                          .toStringAsFixed(2),
                      style: CommonTextStyle.font13weight700white,
                    ),
                    CommonButton(
                        height: 30,
                        width: 85,
                        text:
                            "${double.parse(_.gainerCoinList[index]["p"]).toStringAsFixed(2)}%",
                        textStyle: CommonTextStyle.font10weight500white,
                        onPressed: () {},
                        fillColor: AppColors.greenButton),
                  ],
                ).marginSymmetric(vertical: 10),
            ],
          ).marginSymmetric(horizontal: 15, vertical: 5),
        ));
  }

  //--------------------------------losers container-----------------------------------
  Widget losersContainer(LandingScreenController _) {
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
            children: [
              //-------------------------------Spot row , last price row-------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: CommonTextStyle.font13weight700white,
                  ),
                  Text(
                    "Last Price",
                    style: CommonTextStyle.font13weight700white,
                  ),
                  Text(
                    "24h chg%",
                    style: CommonTextStyle.font13weight700white,
                  ),
                ],
              ),
              CommonSpaces.spaceVertical13,

              for (int index = 0; index < 10; index++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          _.loserCoinList[index]["s"],
                          style: CommonTextStyle.font13weight700white,
                        ),
                      ],
                    ),
                    Text(
                      double.parse(_.loserCoinList[index]["c"])
                          .toStringAsFixed(2),
                      style: CommonTextStyle.font13weight700white,
                    ),
                    CommonButton(
                        height: 30,
                        width: 85,
                        text:
                            "${double.parse(_.loserCoinList[index]["p"]).toStringAsFixed(2)}%",
                        textStyle: CommonTextStyle.font10weight500white,
                        onPressed: () {},
                        fillColor: AppColors.redButton),
                  ],
                ).marginSymmetric(vertical: 10),
            ],
          ).marginSymmetric(horizontal: 15, vertical: 5),
        ));
  }

  //--------------------------------New Listings-----------------------------------
  Widget newListingsContainer(LandingScreenController _) {
    return Container(
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
        children: [
          //-------------------------------Spot row , last price row-------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: CommonTextStyle.font13weight700white,
              ),
              Text(
                "Last Price",
                style: CommonTextStyle.font13weight700white,
              ),
              Text(
                "24h chg%",
                style: CommonTextStyle.font13weight700white,
              ),
            ],
          ),
          CommonSpaces.spaceVertical13,

          Expanded(
            child: ListView.builder(
                itemCount: _.newListingsCurrencyName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                _.newListingsCurrencyName[index],
                                style: CommonTextStyle.font13weight700white,
                              ),
                              Text(
                                "/USDT",
                                style: CommonTextStyle.font10weight500white,
                              ),
                            ],
                          ),
                          Text(
                            _.newListingsCurrencyLastPrice[index],
                            style: CommonTextStyle.font13weight700white,
                          ),
                          CommonButton(
                              height: 30,
                              width: 80,
                              text: "+4.01%",
                              textStyle: CommonTextStyle.font10weight500white,
                              onPressed: () {},
                              fillColor: AppColors.redButton),
                        ],
                      ).marginSymmetric(vertical: 10),

                    ],
                  );
                }),
          ),
        ],
      ).marginSymmetric(horizontal: 15, vertical: 5),
    );
  }
}
