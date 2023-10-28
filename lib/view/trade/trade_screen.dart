import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    TradeScreenController controller = Get.put(TradeScreenController());

    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: bodyData(context, scaffoldKey),
        ),
        drawer: drawer(controller));
  }

  bodyData(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return GetBuilder<TradeScreenController>(
        init: TradeScreenController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: AppColors.backgroundColor,
            child: _.isLoading == true
                ? const AppLoader()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _.selectedTab = "Spot";
                                _.update();
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
                                        color: _.selectedTab == 'Spot'
                                            ? Colors.amber
                                            : Colors.transparent,
                                        width: 2),
                                  ),
                                ),
                                child: const Text(
                                  "Spot",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                _.selectedTab = "P2P";
                                _.update();
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
                                        color: _.selectedTab == 'P2P'
                                            ? Colors.amber
                                            : Colors.transparent,
                                        width: 2),
                                  ),
                                ),
                                child: const Text(
                                  "P2P",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ).marginOnly(top: 40, right: 20, left: 20),

                        const Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                        ),

                        //-----------------------Drawer row-------------------

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              child: const Icon(Icons.menu_open_outlined,
                                  color: Colors.white, size: 35),
                            ),
                            Text(
                              _.coinName.isEmpty
                                  ? ""
                                  : _.coinName,
                              style: CommonTextStyle.font28weight700white,
                            ).marginOnly(left: 8),
                            Text(
                              _.coinChange.isEmpty?"":
                              _.coinChange,
                              style: _.coinChange.contains("-")?CommonTextStyle.font10weight700red:
                              CommonTextStyle.font13weight700green,
                            ).marginOnly(left: 18),
                            const Spacer(),
                            const Icon(
                              Icons.auto_graph,
                              color: Colors.white,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.graphic_eq,
                              color: Colors.white,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.more_vert_sharp,
                              color: Colors.white,
                              size: 15,
                            ),
                          ],
                        ).marginSymmetric(horizontal: 10),

                        SizedBox(
                          height: Get.height / 1.6,
                          width: Get.width,
                          child: Obx(() => _.areColumnsSwapped.value
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height / 1.6,
                                      width: Get.width / 2.4,
                                      child: Column(
                                        children: [
                                          //---------------------Price and amount heading tags-----------
                                          Row(
                                            children: [
                                              Text(
                                                'Price',
                                                style: CommonTextStyle
                                                    .font13weight700white,
                                              ),
                                              const Spacer(),
                                              Text(
                                                'Amount',
                                                style: CommonTextStyle
                                                    .font13weight700white,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '(USDT)',
                                                style: CommonTextStyle
                                                    .font13weight700white,
                                              ).marginOnly(left: 10),
                                              const Spacer(),
                                              Text(
                                                '(ET)',
                                                style: CommonTextStyle
                                                    .font13weight700white,
                                              ).marginOnly(right: 20),
                                            ],
                                          ),

                                          //-------------------Price and amount value row-----------------

                                          SizedBox(
                                            height: Get.height / 4.3,
                                            child: ListView.builder(
                                                itemCount: _.priceUSDT.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Row(
                                                    children: [
                                                      Text(
                                                        _.priceUSDT[index],
                                                        style: CommonTextStyle
                                                            .font13weight700red,
                                                      ).marginOnly(left: 10),
                                                      const Spacer(),
                                                      Text(
                                                        _.amountUSDT[index],
                                                        style: CommonTextStyle
                                                            .font13weight700white,
                                                      ).marginOnly(right: 20),
                                                    ],
                                                  ).marginSymmetric(
                                                      vertical: 5);
                                                }),
                                          ),

                                          //---------------------Total------------------------
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "4.0931",
                                                style: CommonTextStyle
                                                    .font18weight700red,
                                              )),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "=\$4.09",
                                              style: CommonTextStyle
                                                  .font13weight700white,
                                            ),
                                          ),

                                          //------------------------Green price and amount--------------
                                          SizedBox(
                                            height: Get.height / 4.2,
                                            child: ListView.builder(
                                                itemCount: _.priceUSDT.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Row(
                                                    children: [
                                                      Text(
                                                        _.priceUSDT[index],
                                                        style: CommonTextStyle
                                                            .font13weight700green,
                                                      ).marginOnly(left: 10),
                                                      const Spacer(),
                                                      Text(
                                                        _.amountUSDT[index],
                                                        style: CommonTextStyle
                                                            .font13weight700white,
                                                      ).marginOnly(right: 20),
                                                    ],
                                                  ).marginSymmetric(
                                                      vertical: 5);
                                                }),
                                          ),

                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: GestureDetector(
                                              onTap: () {
                                                _.swapColumns();
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.grey.shade900,
                                                child: const Icon(
                                                  Icons
                                                      .swap_horizontal_circle_outlined,
                                                  color: Colors.white,
                                                ),
                                              ).marginSymmetric(horizontal: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //----------------------------Second half of screen---------------
                                    SizedBox(
                                      height: Get.height / 1.6,
                                      width: Get.width / 2,
                                      child: Column(
                                        children: [
                                          //-----------------Buy and sell button row----------------
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  color: AppColors
                                                      .textFieldFillColor,
                                                  height: 40,
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          _.buyButtonPress =
                                                              true;
                                                          _.update();
                                                        },
                                                        child: Container(
                                                          width:
                                                              _.buyButtonPress ==
                                                                      true
                                                                  ? Get.width /
                                                                      3.5
                                                                  : Get.width /
                                                                      5.8,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _.buyButtonPress ==
                                                                    true
                                                                ? AppColors
                                                                    .greenButton
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topRight: Radius
                                                                  .circular(40),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          40),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Buy",
                                                                style: CommonTextStyle
                                                                    .font13weight700white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          _.buyButtonPress =
                                                              false;
                                                          _.update();
                                                        },
                                                        child: Container(
                                                          width:
                                                              _.buyButtonPress ==
                                                                      false
                                                                  ? Get.width /
                                                                      3.5
                                                                  : Get.width /
                                                                      5.8,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _.buyButtonPress ==
                                                                    false
                                                                ? AppColors
                                                                    .redButton
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        40),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        40)),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Sell",
                                                                style: CommonTextStyle
                                                                    .font13weight700white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          //---------------Markets container------------------------

                                          Container(
                                            height: 40,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.textFieldFillColor,
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Icon(
                                                  Icons.info_outline,
                                                  size: 15,
                                                  color: Colors.white,
                                                ).marginOnly(right: 10),
                                                DropdownButton<String>(
                                                  dropdownColor: AppColors
                                                      .textFieldFillColor,
                                                  style: CommonTextStyle
                                                      .font13weight700white,
                                                  iconEnabledColor:
                                                      Colors.white,
                                                  iconDisabledColor:
                                                      Colors.white,
                                                  isExpanded: false,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  alignment:
                                                      AlignmentDirectional
                                                          .topStart,
                                                  underline: Container(
                                                    color: Colors.transparent,
                                                  ),
                                                  value: _.selectedOption,
                                                  onChanged: (newValue) {
                                                    _.selectedOption =
                                                        newValue.toString();
                                                    _.update();
                                                  },
                                                  items: <String>[
                                                    'Market',
                                                    'Limit',
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ],
                                            ),
                                          ).marginOnly(top: 15),
                                          const SizedBox(height: 8),
                                          //-----------------Container if market select--------------------

                                          _.selectedOption == "Market"
                                              ? Container(
                                                  height: 40,
                                                  width: Get.width,
                                                  color: AppColors
                                                      .textFieldFillColor,
                                                  child: Center(
                                                      child: Text(
                                                    _.selectedOption,
                                                    style: CommonTextStyle
                                                        .font13weight700white,
                                                  )),
                                                )
                                              :

                                              //-----------------Container if limit select---------------------

                                              Obx(
                                                  () => Container(
                                                    height: 40,
                                                    width: Get.width,
                                                    color: AppColors
                                                        .textFieldFillColor,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            _.decrement();
                                                          },
                                                          child: const Text(
                                                            "--",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            _.limitValue.value
                                                                .toString(),
                                                            style: CommonTextStyle
                                                                .font13weight700white,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _.increment();
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ).marginSymmetric(
                                                        horizontal: 10),
                                                  ),
                                                ),

                                          //------------------Amount and total container-------------

                                          _.selectedOption == "Market"
                                              ? Obx(
                                                  () => Container(
                                                    height: 30,
                                                    width: Get.width,
                                                    color: AppColors
                                                        .textFieldFillColor,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              _.isAmountBtnPress
                                                                  .value = true;
                                                              _.totalUSDT
                                                                  .clear();
                                                            },
                                                            child: Container(
                                                              color: _.isAmountBtnPress
                                                                          .value ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .transparent,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "Amount",
                                                                    style: CommonTextStyle
                                                                        .font13weight700white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              _.isAmountBtnPress
                                                                      .value =
                                                                  false;
                                                              _.amountEt.value
                                                                  .clear();
                                                            },
                                                            child: Container(
                                                              color: _.isAmountBtnPress
                                                                          .value ==
                                                                      false
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .transparent,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "Total",
                                                                    style: CommonTextStyle
                                                                        .font13weight700white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ).marginSymmetric(
                                                      vertical: 10),
                                                )
                                              : const SizedBox(),

                                          //-------------------Amount(ET) container-----------------

                                          Obx(
                                            () => CommonTextField(
                                              disableBorderColor: Colors.white,
                                              hintText:
                                                  _.isAmountBtnPress.value ==
                                                          true
                                                      ? "Amount(ET)"
                                                      : "Total(USDT)",
                                              controller:
                                                  _.isAmountBtnPress.value ==
                                                          true
                                                      ? _.amountEt.value
                                                      : _.totalUSDT,
                                              bordercolor: Colors.white,
                                              fillcolor:
                                                  AppColors.textFieldFillColor,
                                              prefixIcon: Icons.more_horiz,
                                              toggleIcon: Icons.add,
                                              togglePassword: true,
                                              focus: FocusNode(
                                                  canRequestFocus: true),
                                              prefixIconTap: () {
                                                if (_.isAmountBtnPress.value ==
                                                    true) {
                                                  _.amountDecrement();
                                                }
                                              },
                                              toggleFunction: () {
                                                if (_.isAmountBtnPress.value ==
                                                    true) {
                                                  _.amountIncrement();
                                                }
                                              },
                                              onChanged: (value) {
                                                if (_.isAmountBtnPress.value ==
                                                    true) {
                                                  if (value
                                                      .toString()
                                                      .isNotEmpty) {
                                                    _.amountValue.value =
                                                        Decimal.parse(value);
                                                    _.update();
                                                  } else {
                                                    _.amountValue.value =
                                                        Decimal.parse('0.00');
                                                  }
                                                }
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),

                                          //-----------------slider code---------------
                                          SizedBox(
                                            width: Get.width,
                                            child: SfSlider(
                                              activeColor:
                                                  AppColors.yellowIconsColor,
                                              labelPlacement:
                                                  LabelPlacement.onTicks,
                                              showDividers: true,
                                              overlayShape:
                                                  const SfOverlayShape(),
                                              dividerShape:
                                                  const SfDividerShape(),
                                              edgeLabelPlacement:
                                                  EdgeLabelPlacement.auto,
                                              min: 0.0,
                                              max: 100.0,
                                              value: _.value,
                                              interval: 25,
                                              showTicks: true,
                                              showLabels: true,
                                              enableTooltip: true,
                                              minorTicksPerInterval: 0,
                                              onChanged: (dynamic value) {
                                                _.value = value;
                                                _.update();
                                                Vibration.vibrate(
                                                    duration: 500);
                                              },
                                            ),
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Avbl",
                                                style: CommonTextStyle
                                                    .font12weight500white,
                                              ),
                                              Text("-USDT",
                                                  style: CommonTextStyle
                                                      .font12weight500white),
                                            ],
                                          ).marginOnly(top: 10),
                                          const Spacer(),

                                          _.isLogin.value == true
                                              ? CommonButton(
                                                      height: 40,
                                                      width: Get.width,
                                                      text: _.buyButtonPress ==
                                                                  true &&
                                                              _.coinName.isEmpty
                                                          ? "Buy"
                                                          : _.buyButtonPress ==
                                                                      true &&
                                                                  _.coinName
                                                                      .isNotEmpty
                                                              ? "Buy(${_.coinName})"
                                                              : _.buyButtonPress ==
                                                                          false &&
                                                                      _.coinName
                                                                          .isEmpty
                                                                  ? "Sell"
                                                                  : "Sell(${_.coinName})",
                                                      textStyle: CommonTextStyle
                                                          .font13weight700white,
                                                      onPressed: () async {
                                                        if(_.coinName.isEmpty){
                                                          ShowToastMessage("Please select coin from market");

                                                        }else {
                                                          await _
                                                              .buyAndSellTrade();
                                                        }
                                                      },
                                                      fillColor:
                                                          _.buyButtonPress ==
                                                                  true
                                                              ? AppColors
                                                                  .greenButton
                                                              : AppColors
                                                                  .redButton)
                                                  .marginOnly(bottom: 15)
                                              : CommonButton(
                                                      height: 40,
                                                      width: Get.width,
                                                      text: "Login",
                                                      textStyle: CommonTextStyle
                                                          .font13weight700white,
                                                      onPressed: () {
                                                        Get.toNamed(
                                                            Routes.loginScreen);
                                                      },
                                                      fillColor:
                                                          AppColors.greenButton)
                                                  .marginOnly(bottom: 15),
                                        ],
                                      ),
                                    ).marginOnly(left: 5),
                                  ],
                                ).marginSymmetric(horizontal: 10)
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height / 1.6,
                                      width: Get.width / 2,
                                      child: Column(
                                        children: [
                                          //-----------------Buy and sell button row----------------
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  color: AppColors
                                                      .textFieldFillColor,
                                                  height: 40,
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          _.buyButtonPress =
                                                              true;
                                                          _.update();
                                                        },
                                                        child: Container(
                                                          width:
                                                              _.buyButtonPress ==
                                                                      true
                                                                  ? Get.width /
                                                                      3.5
                                                                  : Get.width /
                                                                      5.8,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _.buyButtonPress ==
                                                                    true
                                                                ? AppColors
                                                                    .greenButton
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        40),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        40)),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Buy",
                                                                style: CommonTextStyle
                                                                    .font13weight700white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          _.buyButtonPress =
                                                              false;
                                                          _.update();
                                                        },
                                                        child: Container(
                                                          width:
                                                              _.buyButtonPress ==
                                                                      false
                                                                  ? Get.width /
                                                                      3.5
                                                                  : Get.width /
                                                                      5.8,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _.buyButtonPress ==
                                                                    false
                                                                ? AppColors
                                                                    .redButton
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        40),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        40)),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Sell",
                                                                style: CommonTextStyle
                                                                    .font13weight700white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          //---------------Markets container------------------------

                                          Container(
                                            height: 40,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.textFieldFillColor,
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Icon(
                                                  Icons.info_outline,
                                                  size: 15,
                                                  color: Colors.white,
                                                ).marginOnly(right: 10),
                                                DropdownButton<String>(
                                                  dropdownColor: AppColors
                                                      .textFieldFillColor,
                                                  style: CommonTextStyle
                                                      .font13weight700white,
                                                  iconEnabledColor:
                                                      Colors.white,
                                                  iconDisabledColor:
                                                      Colors.white,
                                                  isExpanded: false,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  alignment:
                                                      AlignmentDirectional
                                                          .topStart,
                                                  underline: Container(
                                                    color: Colors.transparent,
                                                  ),
                                                  value: _.selectedOption,
                                                  onChanged: (newValue) {
                                                    _.selectedOption =
                                                        newValue.toString();
                                                    _.update();
                                                  },
                                                  items: <String>[
                                                    'Market',
                                                    'Limit',
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                ),
                                              ],
                                            ),
                                          ).marginOnly(top: 15),
                                          const SizedBox(height: 8),
                                          //-----------------Container if market select--------------------

                                          _.selectedOption == "Market"
                                              ? Container(
                                                  height: 40,
                                                  width: Get.width,
                                                  color: AppColors
                                                      .textFieldFillColor,
                                                  child: Center(
                                                      child: Text(
                                                    _.selectedOption,
                                                    style: CommonTextStyle
                                                        .font13weight700white,
                                                  )),
                                                )
                                              :

                                              //-----------------Container if limit select---------------------

                                              Obx(
                                                  () => Container(
                                                    height: 40,
                                                    width: Get.width,
                                                    color: AppColors
                                                        .textFieldFillColor,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            _.decrement();
                                                          },
                                                          child: const Text(
                                                            "--",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            _.limitValue.value
                                                                .toString(),
                                                            style: CommonTextStyle
                                                                .font13weight700white,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _.increment();
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ).marginSymmetric(
                                                        horizontal: 10),
                                                  ),
                                                ),

                                          //------------------Amount and total container-------------

                                          _.selectedOption == "Market"
                                              ? Obx(
                                                  () => Container(
                                                    height: 30,
                                                    width: Get.width,
                                                    color: AppColors
                                                        .textFieldFillColor,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              _.isAmountBtnPress
                                                                  .value = true;
                                                              _.totalUSDT
                                                                  .clear();
                                                            },
                                                            child: Container(
                                                              color: _.isAmountBtnPress
                                                                          .value ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .transparent,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "Amount",
                                                                    style: CommonTextStyle
                                                                        .font13weight700white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              _.isAmountBtnPress
                                                                      .value =
                                                                  false;
                                                              _.amountEt.value
                                                                  .clear();
                                                            },
                                                            child: Container(
                                                              color: _.isAmountBtnPress
                                                                          .value ==
                                                                      false
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .transparent,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "Total",
                                                                    style: CommonTextStyle
                                                                        .font13weight700white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ).marginSymmetric(
                                                      vertical: 10),
                                                )
                                              : const SizedBox(),

                                          //-------------------Amount(ET) container-----------------

                                          Obx(
                                            () => CommonTextField(
                                              disableBorderColor: Colors.white,
                                              hintText:
                                                  _.isAmountBtnPress.value ==
                                                          true
                                                      ? "Amount(ET)"
                                                      : "Total(USDT)",
                                              controller:
                                                  _.isAmountBtnPress.value ==
                                                          true
                                                      ? _.amountEt.value
                                                      : _.totalUSDT,
                                              bordercolor: Colors.white,
                                              fillcolor:
                                                  AppColors.textFieldFillColor,
                                              prefixIcon: Icons.more_horiz,
                                              toggleIcon: Icons.add,
                                              togglePassword: true,
                                              focus: FocusNode(
                                                  canRequestFocus: true),
                                              prefixIconTap: () {
                                                if (_.isAmountBtnPress.value ==
                                                    true) {
                                                  _.amountDecrement();
                                                }
                                              },
                                              toggleFunction: () {
                                                if (_.isAmountBtnPress.value ==
                                                    true) {
                                                  _.amountIncrement();
                                                }
                                              },
                                              onChanged: (value) {
                                                if (_.isAmountBtnPress.value ==
                                                    true) {
                                                  if (value
                                                      .toString()
                                                      .isNotEmpty) {
                                                    _.amountValue.value =
                                                        Decimal.parse(value);
                                                    _.update();
                                                  } else {
                                                    _.amountValue.value =
                                                        Decimal.parse('0.00');
                                                  }
                                                }
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),

                                          //-----------------slider code---------------
                                          SizedBox(
                                            width: Get.width,
                                            child: SfSlider(
                                              activeColor:
                                                  AppColors.yellowIconsColor,
                                              labelPlacement:
                                                  LabelPlacement.onTicks,
                                              showDividers: true,
                                              overlayShape:
                                                  const SfOverlayShape(),
                                              dividerShape:
                                                  const SfDividerShape(),
                                              edgeLabelPlacement:
                                                  EdgeLabelPlacement.auto,
                                              min: 0.0,
                                              max: 100.0,
                                              value: _.value,
                                              interval: 25,
                                              showTicks: true,
                                              showLabels: true,
                                              enableTooltip: true,
                                              minorTicksPerInterval: 0,
                                              onChanged: (dynamic value) {
                                                _.value = value;
                                                _.update();
                                                Vibration.vibrate(
                                                    duration: 500);
                                              },
                                            ),
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Avbl",
                                                style: CommonTextStyle
                                                    .font12weight500white,
                                              ),
                                              Text("-USDT",
                                                  style: CommonTextStyle
                                                      .font12weight500white),
                                            ],
                                          ).marginOnly(top: 10),
                                          const Spacer(),

                                          CommonButton(
                                                  height: 40,
                                                  width: Get.width,
                                                  text: "Login",
                                                  textStyle: CommonTextStyle
                                                      .font13weight700white,
                                                  onPressed: () {},
                                                  fillColor:
                                                      AppColors.greenButton)
                                              .marginOnly(bottom: 15),
                                        ],
                                      ),
                                    ),

                                    //------------Second half container----------
                                    SizedBox(
                                      height: Get.height / 1.6,
                                      width: Get.width / 2.4,
                                      child: Column(
                                        children: [
                                          //---------------------Price and amount heading tags-----------
                                          Row(
                                            children: [
                                              Text(
                                                'Price',
                                                style: CommonTextStyle
                                                    .font13weight700white,
                                              ),
                                              const Spacer(),
                                              Text(
                                                'Amount',
                                                style: CommonTextStyle
                                                    .font13weight700white,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '(USDT)',
                                                style: CommonTextStyle
                                                    .font13weight700white,
                                              ).marginOnly(left: 10),
                                              const Spacer(),
                                              Text(
                                                '(ET)',
                                                style: CommonTextStyle
                                                    .font13weight700white,
                                              ).marginOnly(right: 20),
                                            ],
                                          ),

                                          //-------------------Price and amount value row-----------------

                                          SizedBox(
                                            height: Get.height / 4.3,
                                            child: ListView.builder(
                                                itemCount: _.priceUSDT.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Row(
                                                    children: [
                                                      Text(
                                                        _.priceUSDT[index],
                                                        style: CommonTextStyle
                                                            .font13weight700red,
                                                      ).marginOnly(left: 10),
                                                      const Spacer(),
                                                      Text(
                                                        _.amountUSDT[index],
                                                        style: CommonTextStyle
                                                            .font13weight700white,
                                                      ).marginOnly(right: 20),
                                                    ],
                                                  ).marginSymmetric(
                                                      vertical: 5);
                                                }),
                                          ),

                                          //---------------------Total------------------------
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "4.0931",
                                                style: CommonTextStyle
                                                    .font18weight700red,
                                              )),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "=\$4.09",
                                              style: CommonTextStyle
                                                  .font13weight700white,
                                            ),
                                          ),

                                          //------------------------Green price and amount--------------
                                          SizedBox(
                                            height: Get.height / 4.2,
                                            child: ListView.builder(
                                                itemCount: _.priceUSDT.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Row(
                                                    children: [
                                                      Text(
                                                        _.priceUSDT[index],
                                                        style: CommonTextStyle
                                                            .font13weight700green,
                                                      ).marginOnly(left: 10),
                                                      const Spacer(),
                                                      Text(
                                                        _.amountUSDT[index],
                                                        style: CommonTextStyle
                                                            .font13weight700white,
                                                      ).marginOnly(right: 20),
                                                    ],
                                                  ).marginSymmetric(
                                                      vertical: 5);
                                                }),
                                          ),

                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: GestureDetector(
                                              onTap: () {
                                                _.swapColumns();
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.grey.shade900,
                                                child: const Icon(
                                                  Icons
                                                      .swap_horizontal_circle_outlined,
                                                  color: Colors.white,
                                                ),
                                              ).marginSymmetric(horizontal: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).marginSymmetric(horizontal: 10)),
                        ),

                        //--------------------tab bar section--------------
                        SizedBox(
                          height: Get.height / 2.5,
                          width: Get.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _.bottomSelectedTab = "Open Orders";
                                      _.update();
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
                                              color: _.bottomSelectedTab ==
                                                      'Open Orders'
                                                  ? Colors.amber
                                                  : Colors.transparent,
                                              width: 2),
                                        ),
                                      ),
                                      child: const Text(
                                        "Open Orders(0)",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _.bottomSelectedTab = "Assets";
                                      _.update();
                                      Get.toNamed(Routes.loginScreen);
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
                                              color: _.bottomSelectedTab ==
                                                      'Assets'
                                                  ? Colors.amber
                                                  : Colors.transparent,
                                              width: 2),
                                        ),
                                      ),
                                      child: const Text(
                                        "Assets",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.padding_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ).marginOnly(top: 10, right: 20, left: 20),
                              const Divider(
                                thickness: 1.0,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Center(
                                child: Icon(
                                  Icons.screen_search_desktop_outlined,
                                  color: Colors.white,
                                  size: 100,
                                ),
                              ),
                              Text(
                                "No information found",
                                style: CommonTextStyle.font13weight700white,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }

  Widget drawer(TradeScreenController _) {
    return Drawer(
      backgroundColor: AppColors.blackColor,
      width: Get.width / 1.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Markets",
            style: CommonTextStyle.font28weight700white,
          ),
          SizedBox(
            height: 35,
            child: CommonTextField(
              controller: _.searchValue,
              radius: 30,
              fillcolor: AppColors.textFieldFillColor,
              prefixIcon: Icons.search,
              hintText: "Search",
            ),
          ).marginOnly(top: 20),
          SizedBox(
            width: Get.width,
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.transparent,
              ),
              itemCount: 1,
              itemBuilder: (context, index) {
                //----All tab bar Container-----
                return Obx(() => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _.selectDrawerTabs.value = "Favorites";
                            _.update();
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
                                        _.selectDrawerTabs.value == 'Favorites'
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
                        GestureDetector(
                          onTap: () {
                            _.selectDrawerTabs.value = "USDT";
                            _.update();
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
                                    color: _.selectDrawerTabs.value == 'USDT'
                                        ? Colors.amber
                                        : Colors.transparent,
                                    width: 2),
                              ),
                            ),
                            child: const Text(
                              "USDT",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ).marginOnly(right: 27),
                        GestureDetector(
                          onTap: () {
                            _.selectDrawerTabs.value = "BTC";
                            _.update();
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
                                    color: _.selectDrawerTabs.value == 'BTC'
                                        ? Colors.amber
                                        : Colors.transparent,
                                    width: 2),
                              ),
                            ),
                            child: const Text(
                              "BTC",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ).marginOnly(right: 27),
                        GestureDetector(
                          onTap: () {
                            _.selectDrawerTabs.value = "ETH";
                            _.update();
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
                                    color: _.selectDrawerTabs.value == 'ETH'
                                        ? Colors.amber
                                        : Colors.transparent,
                                    width: 2),
                              ),
                            ),
                            child: const Text(
                              "ETH",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ).marginOnly(right: 27),
                        GestureDetector(
                          onTap: () {
                            _.selectDrawerTabs.value = "Zones";
                            _.update();
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
                                    color: _.selectDrawerTabs.value == 'Zones'
                                        ? Colors.amber
                                        : Colors.transparent,
                                    width: 2),
                              ),
                            ),
                            child: const Text(
                              "Zones",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ).marginOnly(right: 27),
                      ],
                    ).marginAll(10));
              },
            ),
          ),
          Obx(
            () => Expanded(
              child: _.selectDrawerTabs.value == "Favorites"
                  ? favoriteContainer(_)
                  : _.selectDrawerTabs.value == "USDT"
                      ? hotContainer(_)
                      : _.selectDrawerTabs.value == "BTC"
                          ? gainerContainer(_)
                          : _.selectDrawerTabs.value == "ETH"
                              ? losersContainer(_)
                              : _.selectDrawerTabs.value == "Zones"
                                  ? newListingsContainer(_)
                                  : const SizedBox(),
            ),
          ),
        ],
      ).marginOnly(top: 80, left: 10, right: 15),
    );
  }

  //-----------------------------------------Favorite container-----------------------
  Widget favoriteContainer(TradeScreenController _) {
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
                    "Name",
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

          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Icon(
              Icons.screen_search_desktop_outlined,
              color: Colors.grey,
              size: 100,
            ),
          ),
          Text(
            "No information found",
            style: CommonTextStyle.font13weight700white,
          ),

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
          // // ).marginSymmetric(vertical: 10),
          // SizedBox(
          //     height: Get.height / 2.7,
          //     width: Get.width,
          //     child: ListView.builder(
          //         itemCount: 4,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Row(
          //             children: [
          //               Container(
          //                 height: 50,
          //                 width: Get.width / 2.25,
          //                 decoration: BoxDecoration(
          //                   color: Colors.black38,
          //                   borderRadius: BorderRadius.circular(5),
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     Text(
          //                       _.hotCurrencyName[index],
          //                       style: CommonTextStyle.font13weight700white,
          //                     ),
          //                     Text(
          //                       "/USDT",
          //                       style: CommonTextStyle.font10weight500white,
          //                     ),
          //                     const Spacer(),
          //                     const Icon(
          //                       Icons.done,
          //                       color: AppColors.yellowIconsColor,
          //                     ),
          //                   ],
          //                 ).marginSymmetric(horizontal: 10),
          //               ),
          //               const Spacer(),
          //               Container(
          //                 height: 50,
          //                 width: Get.width / 2.25,
          //                 decoration: BoxDecoration(
          //                   color: Colors.black38,
          //                   borderRadius: BorderRadius.circular(5),
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     Text(
          //                       _.hotCurrencyName[index + 1],
          //                       style: CommonTextStyle.font13weight700white,
          //                     ),
          //                     Text(
          //                       "/USDT",
          //                       style: CommonTextStyle.font10weight500white,
          //                     ),
          //                     const Spacer(),
          //                     const Icon(
          //                       Icons.done,
          //                       color: AppColors.yellowIconsColor,
          //                     ),
          //                   ],
          //                 ).marginSymmetric(horizontal: 10),
          //               ),
          //             ],
          //           ).marginSymmetric(horizontal: 15, vertical: 5);
          //         })),
          //
          // //-----------------------Add favorite button-----------------------
          //
          // CommonButton(
          //     width: Get.width / 1.3,
          //     text: "Add Favorite",
          //     textStyle: CommonTextStyle.font10weight500black,
          //     onPressed: () {},
          //     fillColor: AppColors.buttonColor),

          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

//-------------------------------------Hot tab bar container---------------------------
  Widget hotContainer(TradeScreenController _) {
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
                itemCount: _.hotCurrencyName.length,
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
                                _.hotCurrencyName[index],
                                style: CommonTextStyle.font13weight700white,
                              ),
                              Text(
                                "/USDT",
                                style: CommonTextStyle.font10weight500white,
                              ),
                            ],
                          ),
                          Text(
                            _.hotCurrencyLastPrice[index],
                            style: CommonTextStyle.font13weight700white,
                          ),
                          CommonButton(
                              height: 30,
                              width: 80,
                              text: "+4.01%",
                              textStyle: CommonTextStyle.font10weight500white,
                              onPressed: () {},
                              fillColor: AppColors.greenButton),
                        ],
                      ).marginSymmetric(vertical: 10),
                      index == _.hotCurrencyName.length - 1
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "View more",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.amber),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                              ],
                            ).marginOnly(bottom: 10)
                          : const SizedBox(),
                    ],
                  );
                }),
          ),
        ],
      ).marginSymmetric(horizontal: 15, vertical: 5),
    );
  }

  //--------------------------------Gainers container-----------------------------------
  Widget gainerContainer(TradeScreenController _) {
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
                itemCount: _.gainerCurrencyName.length,
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
                                _.gainerCurrencyName[index],
                                style: CommonTextStyle.font13weight700white,
                              ),
                              Text(
                                "/USDT",
                                style: CommonTextStyle.font10weight500white,
                              ),
                            ],
                          ),
                          Text(
                            _.gainerCurrencyLastPrice[index],
                            style: CommonTextStyle.font13weight700white,
                          ),
                          CommonButton(
                              height: 30,
                              width: 80,
                              text: "+4.01%",
                              textStyle: CommonTextStyle.font10weight500white,
                              onPressed: () {},
                              fillColor: AppColors.greenButton),
                        ],
                      ).marginSymmetric(vertical: 10),
                      index == _.gainerCurrencyName.length - 1
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "View more",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.amber),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                              ],
                            ).marginOnly(bottom: 10)
                          : const SizedBox(),
                    ],
                  );
                }),
          ),
        ],
      ).marginSymmetric(horizontal: 15, vertical: 5),
    );
  }

  //--------------------------------losers container-----------------------------------
  Widget losersContainer(TradeScreenController _) {
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
                itemCount: _.loserCurrencyName.length,
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
                                _.loserCurrencyName[index],
                                style: CommonTextStyle.font13weight700white,
                              ),
                              Text(
                                "/USDT",
                                style: CommonTextStyle.font10weight500white,
                              ),
                            ],
                          ),
                          Text(
                            _.loserCurrencyLastPrice[index],
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
                      index == _.loserCurrencyName.length - 1
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "View more",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.amber),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                              ],
                            ).marginOnly(bottom: 10)
                          : const SizedBox(),
                    ],
                  );
                }),
          ),
        ],
      ).marginSymmetric(horizontal: 15, vertical: 5),
    );
  }

  //--------------------------------New Listings-----------------------------------
  Widget newListingsContainer(TradeScreenController _) {
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
                      index == _.loserCurrencyName.length - 1
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "View more",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.amber),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                              ],
                            ).marginOnly(bottom: 10)
                          : const SizedBox(),
                    ],
                  );
                }),
          ),
        ],
      ).marginSymmetric(horizontal: 15, vertical: 5),
    );
  }
}
