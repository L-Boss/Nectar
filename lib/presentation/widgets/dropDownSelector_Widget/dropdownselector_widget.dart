import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class AppDropDownSelector extends StatelessWidget {
  final String? selectedValue;
  final String? label;
  final String? hintText;
  const AppDropDownSelector({
    super.key,
    this.selectedValue,
    this.label,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.labelColorSignIn,
            ),
          ),
          DropdownButtonFormField<String>(
            initialValue: selectedValue,
            hint: Text(hintText ?? 'Select an option'),
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.black.withValues(alpha: 0.5),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.black.withValues(alpha: 0.5),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.splashBackgroundColor,
                  width: 1.5,
                ),
              ),
            ),
            items: ['Option 1', 'Option 2', 'Option 3'].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (String? newValue) {},
          ),
        ],
      ),
    );
  }
}
