import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

class RegistrationScreen extends StatelessWidget with KeysVariables {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Get.off(() =>  LandingScreen());
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
                Get.off(() => LoginScreen());
              },
              child: Text(
                "Login",
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
    return GetBuilder<RegistrationScreenController>(
        init: RegistrationScreenController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: AppColors.blackColor,
            child: _.isLoading == true
                ? AppLoader()
                : Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            style: CommonTextStyle.font28weight700white,
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
                                  inputBorder: const OutlineInputBorder(),
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
                              return ValidateUserEmail
                                  .validatePasswordOnPressed(value.toString());
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          GestureDetector(
                            onTap: () {
                              if (_.isReferralShow == false) {
                                _.isReferralShow = true;
                                _.update();
                              } else {
                                _.isReferralShow = false;
                                _.update();
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Referral ID(Optional)",
                                  style: CommonTextStyle.font12weight500white,
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          _.isReferralShow == true
                              ? CommonTextField(
                                  cursorColor: AppColors.yellowIconsColor,
                                  controller: _.referralID,
                                  fillcolor: AppColors.textFieldFillColor,
                                  hintText: "Please enter your referral ID",
                                )
                              : const SizedBox(),

                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_.isChecked == false) {
                                    _.isChecked = true;
                                    _.update();
                                  } else {
                                    _.isChecked = false;
                                    _.update();
                                  }
                                },
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _.isChecked == true
                                        ? AppColors.yellowIconsColor
                                        : AppColors.textFieldFillColor,
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: AppColors.blackColor,
                                    size: 10,
                                  ),
                                ),
                              ),
                              Text(
                                " I agree to",
                                style: CommonTextStyle.font12weight500white,
                              ),
                              Text(
                                " GNX exchange terms of service",
                                style: CommonTextStyle.font12weight500Yellow,
                              ),
                            ],
                          ).marginOnly(top: 100),

                          //-------------------------continue button----------------------
                          CommonButton(
                                  width: Get.width,
                                  text: "Continue",
                                  textStyle:
                                      CommonTextStyle.font13weight700white,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      if (_.isChecked == true) {
                                        if (_.isPhoneSelected == false) {
                                          if (_.referralID.text.isEmpty) {
                                            await _.registerUser();
                                          } else {
                                            await _
                                                .verifySponsorId()
                                                .then((value) async {
                                              if (_.isReferralIdValid == true) {
                                                await _.registerUser();
                                              } else {
                                                ShowToastMessage(
                                                    AppStrings
                                                        .referralIdNotExist);
                                              }
                                            });
                                          }
                                        } else {
                                          ShowToastMessage(
                                            AppStrings.registerWithPhone,
                                          );
                                        }
                                      } else {
                                        ShowToastMessage(
                                          AppStrings.agreeTermsAndService,
                                        );
                                      }
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
