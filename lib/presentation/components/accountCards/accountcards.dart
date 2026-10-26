import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class AccountCards extends StatelessWidget {
  final Widget leadingIcon;
  final String label;
  const AccountCards({
    super.key,
    required this.label,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Ymargin(y: 10),
            leadingIcon,
            Xmargin(x: 20),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: AppColor.black,
                ),
              ),
            ),
            Xmargin(x: 60),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.black,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
