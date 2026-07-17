import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/presentation/screens/onboarding/onboarding.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:google_test_app/presentation/utilities/screensizes/screensizes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Get.off(() => const Onboarding());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.splashBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              width: screenSizes.screenWidth(context) * 0.6,
              AppAssetPaths.logo,
            ),
          ),

          Positioned(
            bottom: 30.sp,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: CircularProgressIndicator(
                  color: AppColor.white,
                  strokeWidth: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
