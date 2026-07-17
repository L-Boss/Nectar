import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/presentation/utilities/styles/buttons_style/buttons_style.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? buttonColor;
  final Color labelColor;
  final double buttonWidth;
  final Widget? leadingIcon;

  const Buttons({
    super.key,
    required this.onPressed,
    required this.label,
    required this.labelColor,
    required this.buttonWidth,
    this.buttonColor,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: 67.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.r),
          ),
          backgroundColor: buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leadingIcon != null ? leadingIcon! : const SizedBox.shrink(),
            SizedBox(width: leadingIcon != null ? 10.w : 0),
            Text(label, style: buttonStyle.copyWith(color: labelColor)),
          ],
        ),
      ),
    );
  }
}
