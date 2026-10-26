import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/data/controllers/auth_controller.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/screens/login/login.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/screensizes/screensizes.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:google_test_app/presentation/utilities/styles/location_style/location_style.dart';
import 'package:google_test_app/presentation/utilities/styles/signin_style/signin_style.dart';
import 'package:google_test_app/presentation/widgets/formfields/formfields.dart';

class Signup extends StatelessWidget {
  final controller = Get.put(AuthController());
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AppAssetPaths.enterNumberBanner,
              width: screenSizes.screenWidth(context),
              fit: BoxFit.cover,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 77.h, horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppAssetPaths.coloredCarrot,
                      width: 47.w,
                      height: 55.h,
                    ),
                  ),
                  Ymargin(y: 100),
                  Text(
                    "Sign Up",
                    style: signInStyle,
                    softWrap: true,
                    textAlign: TextAlign.left,
                  ),
                  Ymargin(y: 15),
                  Text(
                    "Enter your credentials to continue",
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: locationDescriptionStyle,
                  ),

                  Ymargin(y: 40),
                  AppFormField(
                    label: "Username",
                    hintText: "Enter your username",
                    onChanaged: (value) => controller.name.value = value,
                  ),
                  Ymargin(y: 30),
                  AppFormField(
                    label: "Email",
                    hintText: "Enter your email",
                    onChanaged: (value) => controller.email.value = value,
                  ),
                  Ymargin(y: 30),
                  AppFormField(
                    label: "Password",
                    hintText: "Enter your password",
                    onChanaged: (value) => controller.password.value = value,
                    obscuringCharacter: '*',
                    obscureText: true,
                  ),
                  Ymargin(y: 20),

                  PolicyTexts(onPolicyTap: () {}, onTermsTap: () {}),
                  Ymargin(y: 30),

                  Align(
                    alignment: Alignment.center,
                    child: Obx(() {
                      final control = controller.isLoading.value;
                      return control
                          ? CircularProgressIndicator()
                          : Buttons(
                              onPressed: () async {
                                await controller.signup();
                              },
                              label: "Sign up",
                              labelColor: AppColor.buttonLabelColor,
                              buttonWidth:
                                  screenSizes.screenWidth(context) * 0.85,
                              buttonColor: AppColor.splashBackgroundColor,
                            );
                    }),
                  ),

                  Ymargin(y: 25),
                  AuthTexts(
                    onActionTap: () {
                      Get.to(() => Login());
                    },
                    leadingText: "Already have an account",
                    endingText: "Login",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
