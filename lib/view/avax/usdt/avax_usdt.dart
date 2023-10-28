import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

class AvaxUSDTScreen extends StatelessWidget {
  const AvaxUSDTScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AvaxUSDTController controller = Get.put(AvaxUSDTController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: Row(
          children: [
            const Icon(Icons.menu),
            Text(controller.coinName),
          ],
        ).marginOnly(left: 20),
        actions: [
          const Icon(Icons.speed).marginOnly(right: 10),
          const Icon(Icons.star_border).marginOnly(right: 10)
        ],
      ),
      body: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<AvaxUSDTController>(
        init: AvaxUSDTController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: AppColors.backgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 1.11,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //-------------High low values portion--------------------

                        Container(
                          height: Get.height / 8,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.grey.shade700),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 3,
                                child: Column(
                                  children: [
                                    Text(
                                      "9.456",
                                      style: CommonTextStyle.font28weight700red,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "=\$9.45",
                                          style: CommonTextStyle
                                              .font13weight700white,
                                        ),
                                        Text(
                                          " +2.54%",
                                          style: CommonTextStyle
                                              .font13weight700green,
                                        ),
                                      ],
                                    ).marginOnly(left: 15)
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "24h High",
                                            style: CommonTextStyle
                                                .font13weight700whiteWithOpacity5,
                                          ),
                                          Text("24h Low",
                                              style: CommonTextStyle
                                                  .font13weight700whiteWithOpacity5),
                                          Text("24h Vol(AVAX)",
                                              style: CommonTextStyle
                                                  .font13weight700whiteWithOpacity5),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "9.568",
                                            style: CommonTextStyle
                                                .font13weight700white,
                                          ),
                                          Text("9.075",
                                              style: CommonTextStyle
                                                  .font13weight700white),
                                          Text("487.70k",
                                              style: CommonTextStyle
                                                  .font13weight700white),
                                        ],
                                      ).marginOnly(right: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ).marginOnly(top: 20),
                        ).marginOnly(top: Get.height / 8),

                        Container(
                          height: Get.height / 2.5,
                          width: Get.width,
                          color: Colors.red,
                        ),

                        Obx(
                          () => SizedBox(
                            width: Get.width,
                            child: Column(
                              children: [
                                //-------------------------Tab bars---------------------------
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _.selectedTab.value = "Order Book";
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
                                                color: Colors.transparent),
                                            right: const BorderSide(
                                                color: Colors.transparent),
                                            bottom: BorderSide(
                                                color: _.selectedTab.value ==
                                                        'Order Book'
                                                    ? Colors.amber
                                                    : Colors.transparent,
                                                width: 2),
                                          ),
                                        ),
                                        child: const Text(
                                          "Order Book",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ),
                                    ).marginOnly(left: 6, right: 27),
                                    GestureDetector(
                                      onTap: () {
                                        _.selectedTab.value = "Market History";
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
                                                color: Colors.transparent),
                                            right: const BorderSide(
                                                color: Colors.transparent),
                                            bottom: BorderSide(
                                                color: _.selectedTab.value ==
                                                        'Market History'
                                                    ? Colors.amber
                                                    : Colors.transparent,
                                                width: 2),
                                          ),
                                        ),
                                        child: const Text(
                                          "Market History",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ),
                                    ).marginOnly(left: 6, right: 27),
                                    GestureDetector(
                                      onTap: () {
                                        _.selectedTab.value = "Margin Data";
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
                                                color: Colors.transparent),
                                            right: const BorderSide(
                                                color: Colors.transparent),
                                            bottom: BorderSide(
                                                color: _.selectedTab.value ==
                                                        'Margin Data'
                                                    ? Colors.amber
                                                    : Colors.transparent,
                                                width: 2),
                                          ),
                                        ),
                                        child: const Text(
                                          "Margin Data",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ),
                                    ).marginOnly(left: 6, right: 27),
                                  ],
                                ).marginSymmetric(horizontal: 5),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      color: AppColors.greenButton,
                                    ),
                                    Text(
                                      "  Bid ",
                                      style:
                                          CommonTextStyle.font10weight500white,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      " Ask  ",
                                      style:
                                          CommonTextStyle.font10weight500white,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      color: AppColors.redButton,
                                    ),
                                  ],
                                ),
                                for (int i = 0; i < 20; i++)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "21.72335",
                                        style: CommonTextStyle
                                            .font10weight500white,
                                      ).marginOnly(right: 10),
                                      Text(
                                        "60.84",
                                        style: CommonTextStyle
                                            .font10weight700green,
                                      ).marginOnly(left: 10),
                                      Text(
                                        "60.86",
                                        style:
                                            CommonTextStyle.font10weight700red,
                                      ),
                                      Text(
                                        "14.46111",
                                        style: CommonTextStyle
                                            .font10weight500white,
                                      ).marginOnly(right: 25),
                                    ],
                                  ).marginSymmetric(horizontal: 20, vertical: 8),
                              ],
                            ),
                          ).marginOnly(top: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 70,
                  width: Get.width,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonButton(
                          width: Get.width / 2.5,
                          text: "Buy",
                          textStyle: CommonTextStyle.font12weight500white,
                          onPressed: () {
                            _.controller.updateSelectedButton(true);

                            _.controller.updateCoinName(_.coinName);
                            _.controller.updateChange(_.coinRate);
                            Get.toNamed(Routes.tradeScreen,arguments: {
                              "coin_name":_.coinName,
                              "rate":_.coinRate,
                            }
                            );
                          },
                          fillColor: AppColors.greenButton),
                      CommonButton(
                          width: Get.width / 2.5,
                          text: "Sell",
                          textStyle: CommonTextStyle.font12weight500white,
                          onPressed: () {
                            _.controller.updateSelectedButton(false);
                            _.controller.updateCoinName(_.coinName);
                            _.controller.updateChange(_.coinRate);

                            Get.toNamed(Routes.tradeScreen,arguments: {
                              "coin_name":_.coinName,
                              "rate":_.coinRate,

                            });

                          },
                          fillColor: AppColors.redButton),
                      Column(
                        children: [
                          const Icon(
                            Icons.currency_exchange,
                            color: Colors.white,
                          ),
                          Text(
                            "Currency",
                            style: CommonTextStyle.font10weight500white,
                          ),
                        ],
                      ).marginOnly(right: 10, top: 20)
                    ],
                  ).marginOnly(left: 10),
                ),
              ],
            ),
          );
        });
  }
}
