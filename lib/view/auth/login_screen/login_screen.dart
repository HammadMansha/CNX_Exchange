import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

import '../../dashboard_screen/dashboard_screen.dart';

class LoginScreen extends StatelessWidget with KeysVariables {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            if (Get.currentRoute == Routes.registrationScreen) {
              Get.back();
              Get.back();
            } else {
              Get.back();
            }
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.registrationScreen);
              },
              child: Text(
                "Register",
                style: CommonTextStyle.font16weight500Yellow,
              ),
            ),
          ],
        ),
      ),
      body: bodyData(context),
    );
  }

  bodyData(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        init: LoginScreenController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: AppColors.blackColor,
            child: _.isLoading == true
                ? const AppLoader()
                : Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            width: Get.width / 1.8,
                            color: AppColors.backgroundColor,
                            child: Row(
                              children: [
                                Container(
                                  height: Get.height,
                                  width: Get.width / 2.5,
                                  color: _.isNormalSelect == true
                                      ? AppColors.textFieldFillColor
                                      : Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () {
                                      _.isNormalSelect = true;
                                      _.update();
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.wallet,
                                          color: Colors.white,
                                          size: 15,
                                        ).marginOnly(left: 15, right: 5),
                                        Text(
                                          "Normal Login",
                                          style: CommonTextStyle
                                              .font13weight700white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      _.isNormalSelect = false;
                                      _.update();
                                    },
                                    child: Container(
                                      height: Get.height,
                                      color: _.isNormalSelect == true
                                          ? Colors.transparent
                                          : AppColors.textFieldFillColor,
                                      child: GestureDetector(
                                        onTap: () {
                                          _.isNormalSelect = false;
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Center(
                                              child: Icon(
                                                Icons.wallet,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                _.isPhoneSelected == true ? "Phone" : "Email",
                                style: CommonTextStyle.font12weight500white,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (_.isPhoneSelected == true) {
                                    _.isPhoneSelected = false;
                                    _.update();
                                  } else {
                                    _.isPhoneSelected = true;
                                    _.update();
                                  }
                                },
                                child: Text(
                                  _.isPhoneSelected == true
                                      ? "Login with Email"
                                      : "Login with mobile",
                                  style: CommonTextStyle.font16weight500Yellow,
                                ),
                              ),
                            ],
                          ).marginOnly(top: 25),
                          //--------------------Email text field-------------------
                          _.isPhoneSelected == false
                              ? CommonTextField(
                                  cursorColor: AppColors.yellowIconsColor,
                                  controller: _.email,
                                  fillcolor: AppColors.textFieldFillColor,
                                  hintText: "Please enter your email",
                                  validator: (value) {
                                    return ValidateUserEmail.isEmptyField(
                                        value.toString());
                                  },
                                )
                              : InternationalPhoneNumberInput(
                                  hintText: "Mobile Number",
                                  cursorColor: AppColors.yellowIconsColor,
                                  textStyle:
                                      CommonTextStyle.font10weight500white,
                                  inputDecoration: InputDecoration(
                                    fillColor: AppColors.textFieldFillColor,
                                    filled: true,
                                    hintText: "Mobile Number",
                                    hintStyle:
                                        CommonTextStyle.font14weight300Weight,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors
                                              .textFieldFillColor), // Change the color here
                                    ),
                                  ),
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  ignoreBlank: true,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.white),
                                  initialValue: _.number,
                                  textFieldController: _.phone,
                                  formatInput: true,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputBorder: OutlineInputBorder(),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),

                          const SizedBox(
                            height: 30,
                          ),
                          //-----------------Password text field-----------
                          Text(
                            "Password",
                            style: CommonTextStyle.font12weight500white,
                          ),

                          CommonTextField(
                            cursorColor: AppColors.yellowIconsColor,
                            controller: _.password,
                            fillcolor: AppColors.textFieldFillColor,
                            hintText: "Please enter your password",
                            isTextHidden: _.secureText,
                            togglePassword: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
                            ],
                            toggleIcon: _.secureText == true
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                            toggleFunction: () {
                              _.secureText = !_.secureText;
                              _.update();
                            },
                            validator: (value) {
                              return ValidateUserEmail.isEmptyField(
                                  value.toString());
                            },
                          ),
                          Text(
                            "Forgot Password?",
                            style: CommonTextStyle.font12weight500Yellow,
                          ).marginOnly(top: 10),
                          const SizedBox(
                            height: 30,
                          ),

                          //-------------------------continue button----------------------
                          CommonButton(
                                  width: Get.width,
                                  text: "Login",
                                  textStyle:
                                      CommonTextStyle.font13weight700white,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await _.loginUser();
                                    }
                                  },
                                  fillColor: AppColors.textFieldFillColor)
                              .marginOnly(top: 30),
                        ],
                      ).marginSymmetric(horizontal: 13),
                    ),
                  ),
          );
        });
  }
}
