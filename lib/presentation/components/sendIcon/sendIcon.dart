// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class SendIcons extends StatelessWidget {
  final String? leadingText;
  final Function() onPressed;
  final Function() OnLeadingTextTap;
  const SendIcons({
    super.key,
    this.leadingText,
    required this.onPressed,
    required this.OnLeadingTextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: OnLeadingTextTap,
          child: Text(
            leadingText ?? "",
            style: TextStyle(
              fontFamily: "Gilroy",
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.splashBackgroundColor,
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 67.w,
          height: 67.h,

          decoration: BoxDecoration(
            color: AppColor.splashBackgroundColor,
            borderRadius: BorderRadius.circular(50.sp),
          ),
          child: Center(
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.buttonLabelColor,
                size: 18.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
