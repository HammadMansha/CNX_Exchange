import 'package:flutter/material.dart';

import '../../constants/app_colors/app_colors.dart';

class CommonTextStyle {
  //-----------------------White roboto--------------------
  static TextStyle font14weight300Weight=const TextStyle(
  letterSpacing: 0.4,
  color: Colors.white,
  fontSize: 14.0,
  fontWeight: FontWeight.w300);
  static TextStyle font12weight500white = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.4,
      fontSize: 12,
      fontWeight: FontWeight.w500);

  static TextStyle font13weight700white = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.4,
      fontSize: 13,
      fontWeight: FontWeight.w700);

  static TextStyle font13weight700whiteWithOpacity5 =  TextStyle(
      color: Colors.white.withOpacity(0.5),
      letterSpacing: 0.4,
      fontSize: 13,
      fontWeight: FontWeight.w700);
  static TextStyle font20weight700white = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.4,
      fontSize: 20,
      fontWeight: FontWeight.w700);

  static TextStyle font28weight700white = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.4,
      fontSize: 28,
      fontWeight: FontWeight.w700);

  static TextStyle font10weight500white = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.4,
      fontSize: 10,
      fontWeight: FontWeight.w500);

  //--------------------------Black Roboto text style----------------
  static TextStyle font10weight500black = const TextStyle(
      color: Colors.black,
      letterSpacing: 0.4,
      fontSize: 10,
      fontWeight: FontWeight.w500);

  //--------------------------Green Color roboto-------------------
  static TextStyle font13weight700green = const TextStyle(
      color: Colors.green,
      letterSpacing: 0.4,
      fontSize: 13,
      fontWeight: FontWeight.w700);
  static TextStyle font17weight700green = const TextStyle(
      color: Colors.green,
      letterSpacing: 0.4,
      fontSize: 17,
      fontWeight: FontWeight.w700);
  static TextStyle font10weight700green = const TextStyle(
      color: Colors.green,
      letterSpacing: 0.4,
      fontSize: 10,
      fontWeight: FontWeight.w700);





  //------------------------Yellow roboto text style------------------

  static TextStyle font16weight500Yellow = const TextStyle(
      color: AppColors.yellowIconsColor,
      letterSpacing: 0.4,
      fontSize: 16,
      fontWeight: FontWeight.w500);
  static TextStyle font12weight500Yellow = const TextStyle(
      color: AppColors.yellowIconsColor,
      letterSpacing: 0.4,
      fontSize: 12,
      fontWeight: FontWeight.w500);

  //--------------------------Red color roboto text style


  static TextStyle font13weight700red = const TextStyle(
      color: AppColors.redButton,
      letterSpacing: 0.4,
      fontSize: 13,
      fontWeight: FontWeight.w700);

  static TextStyle font10weight700red = const TextStyle(
      color: AppColors.redButton,
      letterSpacing: 0.4,
      fontSize: 10,
      fontWeight: FontWeight.w700);


  static TextStyle font18weight700red = const TextStyle(
      color: AppColors.redButton,
      letterSpacing: 0.4,
      fontSize: 18,
      fontWeight: FontWeight.w700);

  static TextStyle font17weight700red = const TextStyle(
      color: AppColors.redButton,
      letterSpacing: 0.4,
      fontSize: 17,
      fontWeight: FontWeight.w700);


  static TextStyle font28weight700red = const TextStyle(
      color: AppColors.redButton,
      letterSpacing: 0.4,
      fontSize: 28,
      fontWeight: FontWeight.w700);
}
