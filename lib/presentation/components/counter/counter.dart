import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AppCounter extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const AppCounter({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CountStepper(
      defaultValue: value,
      min: 0,
      max: 999,
      onPressed: (value) {
        onChanged(value);
      },

      iconDecrement: Text(
        "-",
        style: TextStyle(
          color: const Color(0xFFB3B3B3),
          fontFamily: "Gilroy",
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconIncrement: Text(
        "+",
        style: TextStyle(
          color: const Color(0xFF53B175),
          fontFamily: "Gilroy",
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      textStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
    );
  }
}
