import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/route_manager.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/screens/login/login.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/screensizes/screensizes.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:google_test_app/presentation/utilities/styles/location_style/location_style.dart';
import 'package:google_test_app/presentation/utilities/styles/signin_style/signin_style.dart';
import 'package:google_test_app/presentation/widgets/formfields/formfields.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
                  ),
                  Ymargin(y: 30),
                  AppFormField(label: "Email", hintText: "Enter your email"),
                  Ymargin(y: 30),
                  AppFormField(
                    label: "Password",
                    hintText: "Enter your password",
                    obscuringCharacter: '*',
                    obscureText: true,
                    sufficIcon: InkWell(
                      onTap: () {},
                      child: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  Ymargin(y: 20),

                  PolicyTexts(onPolicyTap: () {}, onTermsTap: () {}),
                  Ymargin(y: 30),

                  Align(
                    alignment: Alignment.center,
                    child: Buttons(
                      onPressed: () {
                        Get.off(() => Login());
                      },
                      label: "Sign Up",
                      labelColor: AppColor.buttonLabelColor,
                      buttonWidth: screenSizes.screenWidth(context) * 0.85,
                      buttonColor: AppColor.splashBackgroundColor,
                    ),
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
