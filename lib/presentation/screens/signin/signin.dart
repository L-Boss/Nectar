import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/screens/signin/enterNumber.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/screensizes/screensizes.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:google_test_app/presentation/utilities/styles/signin_style/signin_style.dart';
import 'package:google_test_app/presentation/widgets/numberInput_widget/numberinput_widget.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AppAssetPaths.signupBanner,
              width: screenSizes.screenWidth(context),
              fit: BoxFit.cover,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 374.h, horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get you groceries\nwith nectar",
                    style: signInStyle,
                    softWrap: true,
                    textAlign: TextAlign.left,
                  ),
                  Ymargin(y: 30),
                  InkWell(
                    onTap: () {
                      Get.to(() => const EnterNumber());
                    },
                    child: NumberInputField(isEnabled: false),
                  ),
                  Ymargin(y: 40),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "or connect with social media",
                      style: signInDescriptionStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Ymargin(y: 37),
                  Buttons(
                    onPressed: () {},
                    label: "Continue with Google",
                    labelColor: AppColor.grey,
                    buttonWidth: 364.w,
                    buttonColor: AppColor.googleButtonColor,
                    leadingIcon: SvgPicture.asset(AppAssetPaths.googleSVG),
                  ),
                  Ymargin(y: 20),
                  Buttons(
                    onPressed: () {},
                    label: "Continue with Facebook",
                    labelColor: AppColor.grey,
                    buttonWidth: 364.w,
                    buttonColor: AppColor.facebookButtonColor,
                    leadingIcon: SvgPicture.asset(AppAssetPaths.facebookSVG),
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
