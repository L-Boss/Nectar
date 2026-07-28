// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? obscuringCharacter;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? sufficIcon;
  final Color? suffixIconColor;
  const AppFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscuringCharacter,
    this.obscureText,
    this.keyboardType,
    this.sufficIcon,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.labelColorSignIn,
          ),
        ),
        Ymargin(y: 10),
        TextFormField(
          cursorColor: AppColor.black,
          decoration: InputDecoration(
            enabled: true,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.splashBackgroundColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.labelColorSignIn),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: AppColor.labelColorSignIn,
            ),
            suffixIcon: sufficIcon,
            suffixIconColor: suffixIconColor,
          ),
        ),
      ],
    );
  }
}

class AuthTexts extends StatelessWidget {
  final String leadingText;
  final String endingText;
  final Function() onActionTap;
  const AuthTexts({
    super.key,
    required this.leadingText,
    required this.endingText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$leadingText? ",
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onActionTap,
          child: Text(
            endingText,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.splashBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class PolicyTexts extends StatelessWidget {
  final Function() onPolicyTap;
  final Function() onTermsTap;
  const PolicyTexts({
    super.key,
    required this.onPolicyTap,
    required this.onTermsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      children: [
        Text(
          "By continuing you agree to our ",
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.labelColorSignIn,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onTermsTap,
          child: Text(
            "Terms of Service ",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.splashBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "and ",
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.labelColorSignIn,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onPolicyTap,
          child: Text(
            "Privacy Policy.",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.splashBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
