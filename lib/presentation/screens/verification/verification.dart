import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/presentation/components/header/header.dart';
import 'package:google_test_app/presentation/components/sendIcon/sendIcon.dart';
import 'package:google_test_app/presentation/screens/location/location.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/screensizes/screensizes.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:google_test_app/presentation/utilities/styles/signin_style/signin_style.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

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
              padding: EdgeInsets.symmetric(vertical: 150.h, horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your 4-digit code",
                    style: signInStyle,
                    softWrap: true,
                    textAlign: TextAlign.left,
                  ),
                  Ymargin(y: 30),
                  TextFormField(
                    cursorColor: AppColor.black,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      hintText: "- - - -",

                      hintStyle: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        fontFamily: "Gilroy",
                      ),
                      labelText: "Code",
                      labelStyle: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.labelColorSignIn,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.splashBackgroundColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Ymargin(y: 448),
                  SendIcons(
                    onPressed: () {
                      Get.to(() => Location());
                    },
                    leadingText: "Resend Code",
                    OnLeadingTextTap: () {},
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
