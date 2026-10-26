import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/components/header/header.dart';
import 'package:google_test_app/presentation/screens/login/login.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/screensizes/screensizes.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:google_test_app/presentation/utilities/styles/location_style/location_style.dart';
import 'package:google_test_app/presentation/widgets/dropDownSelector_Widget/dropdownselector_widget.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppHeader(
        leadingIcon: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
            size: 18.sp,
            weight: 3.sp,
          ),
        ),
      ),
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
              padding: EdgeInsets.symmetric(vertical: 130.h, horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssetPaths.locationImage,
                    width: 224.w,
                    height: 170.h,
                  ),
                  Ymargin(y: 10),
                  Text(
                    "Select Your Location",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: locationTitleStyle,
                  ),
                  Text(
                    "Switch on your location to stay in tune with what’s happening in your area",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: locationDescriptionStyle,
                  ),

                  Ymargin(y: 90),
                  AppDropDownSelector(
                    label: "Your Zone",
                    hintText: "Select your zone",
                    selectedValue: null,
                  ),
                  Ymargin(y: 30),
                  AppDropDownSelector(
                    label: "Your Area",
                    hintText: "Select your area",
                    selectedValue: null,
                  ),

                  Ymargin(y: 40),
                  Buttons(
                    onPressed: () {
                      Get.offAll(() => Login());
                    },
                    label: "Submit",
                    labelColor: AppColor.buttonLabelColor,
                    buttonWidth: screenSizes.screenWidth(context) * 0.85,
                    buttonColor: AppColor.splashBackgroundColor,
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
