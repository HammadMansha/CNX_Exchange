import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Color? fillcolor;
  final Color? bordercolor;
  final Color? disableBorderColor;
  final bool isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final IconData? prefixIcon;
  final bool? togglePassword;
  final int? maxLength;
  final int maxLine;
  final Function()? toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function()? onTap;
  final Function()? prefixIconTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  final TextInputAction? textInputAction;
  final Color? hintTextColor;
  final Color? cursorColor;
  final bool isInlineBorder;
  final double radius;
  final bool autoFocus;


  const CommonTextField({
    Key? key,
    @required this.controller,
    this.validator,
    this.bordercolor,
    this.disableBorderColor,
    this.radius=4,
    this.autoFocus=false,
    this.labelText,
    this.fillcolor,
    this.hintText,
    this.isTextHidden = false,
    this.buttonIcon,
    this.prefixIcon,
    this.onChanged,
    this.togglePassword = false,
    this.toggleFunction,
    this.toggleIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.maxLength,
    this.maxLine = 1,
    this.readOnly,
    this.onTap,
    this.inputFormatters,
    this.prefixIconTap,
    this.hintTextColor,
    this.cursorColor,
    this.focus,
    this.isInlineBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);
    return MediaQuery(
      data: mqDataNew,
      child: TextFormField(
        autofocus: autoFocus,
        cursorColor: cursorColor ?? Colors.white,
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        obscureText: isTextHidden,
        readOnly: readOnly == null ? false : true,
        onTap: onTap,
        maxLength: maxLength,
        maxLines: maxLine,
        focusNode: focus,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 10.0,
          ),
          prefixIcon: prefixIcon != null
              ? GestureDetector(
                  onTap: prefixIconTap,
                  child: Icon(
                    prefixIcon,
                    color: Colors.white,
                    size: 20.0,
                  ),
                )
              : null,
          suffixIcon: togglePassword!
              ? GestureDetector(
                  onTap: toggleFunction,
                  child: Icon(
                    toggleIcon,
                    color: Colors.white,
                  ))
              : null,

          //-----------------Without OnPress text field border Colour-----------
          enabledBorder: isInlineBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: disableBorderColor ?? AppColors.textFieldFillColor,
                  ),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: disableBorderColor ?? AppColors.textFieldFillColor,
                  ),
                  borderRadius:  BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
          focusedBorder: isInlineBorder
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                  color: bordercolor ?? AppColors.textFieldFillColor,
                ))
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bordercolor ?? AppColors.textFieldFillColor,
                  ),
                  borderRadius:  BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
          hintText: hintText,
          fillColor: fillcolor ?? Colors.transparent,
          filled: true,
          helperStyle: TextStyle(
            letterSpacing: 0.4,
            color: hintTextColor ?? Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
          ),
          hintStyle: TextStyle(
              letterSpacing: 0.4,
              color: hintTextColor ?? Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w300),
          contentPadding: const EdgeInsets.all(10.0),
          labelText: labelText,
          labelStyle: TextStyle(
              letterSpacing: 0.4,
              color: Colors.white.withOpacity(0.43),
              fontSize: 13.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400),
          border: isInlineBorder
              ?  UnderlineInputBorder(
                  borderSide:const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(radius)))
              :  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
        ),
        style: const TextStyle(
            letterSpacing: 0.4,
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
