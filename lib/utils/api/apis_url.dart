class ApiData {
  //-----------------------Base url--------
  static const String baseUrl = "https://cnx-app-api.nakshtech.info";
  //---------------------All API's call end points------------
  //------------------------------Register user API------------------
  static const String registerUser = "/registration_temp_OTP";

  //-------------------------Verify OTP----------------------------
  static const String verifyRegisterUser="/registration_final";
  //------------------------------Login user API------------------
  static const String loginUser = "/login_Checknow_with_OTP";

  //------------------------------Login user API------------------
  static const String verifySponserID = "/check_sponsorid";

  //----------------------------Coins pair data API---------------------

  static const String coinsPair = "$baseUrl/GetCoinMasterNew";

  //--------------------Buy coins-------------------------
  static const String buyTrade = "$baseUrl/buy_trade";
  static const String sellTrade = "$baseUrl/sell_trade";



}
