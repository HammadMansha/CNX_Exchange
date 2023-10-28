import 'package:gnx_exchange/controller/auth/verify_otp_controller/verify_otp_controller.dart';
import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

class VerifyOtpScreen extends StatelessWidget with KeysVariables {
  VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: bodyData(context),
    ));
  }

  bodyData(BuildContext context) {
    return GetBuilder<VerifyOtpController>(
        init: VerifyOtpController(),
        builder: (_) {
          return Container(
            height: Get.height,
            width: Get.width,
            color: AppColors.backgroundColor,
            child: _.isLoading == true
                ? const AppLoader()
                : Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () => Get.back(),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ).marginOnly(top: 10, right: 10)),
                            Text(
                              "Security Verification",
                              style: CommonTextStyle.font28weight700white,
                            ).marginOnly(top: 10),
                          ],
                        ),
                        Text(
                          "A 6-digit verification code will be sent to your email address",
                          style: CommonTextStyle.font12weight500white,
                        ).marginOnly(top: 10),
                        CommonTextField(
                          cursorColor: AppColors.yellowIconsColor,
                          controller: _.otpInput,
                          fillcolor: AppColors.textFieldFillColor,
                          hintText: "Enter verification code",
                          validator: (value) {
                            return ValidateUserEmail.isEmptyField(
                                value.toString());
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              _.isEmpty.value = false;
                            } else {
                              _.isEmpty.value = true;
                            }
                          },
                        ).marginOnly(top: 30),
                        Obx(
                          () => CommonButton(
                                  width: Get.width,
                                  text: "Submit",
                                  textStyle:
                                      CommonTextStyle.font13weight700white,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await _.verifyOtp();
                                    }
                                  },
                                  fillColor: _.isEmpty.value == true
                                      ? AppColors.textFieldFillColor
                                      : AppColors.yellowIconsColor)
                              .marginOnly(top: 40),
                        ),
                      ],
                    ).marginSymmetric(horizontal: 20),
                  ),
          );
        });
  }
}
