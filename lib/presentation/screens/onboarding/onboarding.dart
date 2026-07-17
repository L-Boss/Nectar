import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/screens/signin/signin.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/screensizes/screensizes.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:google_test_app/presentation/utilities/styles/onboarding_style/onboarding_style.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          SizedBox(
            width: screenSizes.screenWidth(context),
            height: screenSizes.screenHeight(context),
            child: Image.asset(AppAssetPaths.onbordingImage, fit: BoxFit.cover),
          ),

          Positioned(
            bottom: 74.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Image.asset(
                      AppAssetPaths.carrot,
                      width: 48.w,
                      height: 56.h,
                    ),
                    Ymargin(y: 35),
                    Text(
                      "Welcome\nto our store",
                      style: onBoardingTitleStyle,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    Ymargin(y: 19),
                    Text(
                      "Get your groceries in as fast as one hour",
                      style: onBoardingDescriptionStyle,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
                Ymargin(y: 40),
                Buttons(
                  onPressed: () {
                    Get.to(() => const Signin());
                  },
                  label: "Get Started",
                  labelColor: AppColor.buttonLabelColor,
                  buttonWidth: screenSizes.screenWidth(context) * 0.85,
                  buttonColor: AppColor.splashBackgroundColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
