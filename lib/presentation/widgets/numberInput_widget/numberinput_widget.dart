import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class NumberInputField extends StatelessWidget {
  String? label;
  bool isEnabled;
  NumberInputField({super.key, required this.isEnabled, this.label});

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        debugPrint(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        debugPrint(value as String?);
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      isEnabled: isEnabled,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      formatInput: false,
      spaceBetweenSelectorAndTextField: 0,
      cursorColor: AppColor.black,

      inputDecoration: InputDecoration(
        labelText: label,
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
        hintText: '',
        hintStyle: TextStyle(
          color: AppColor.black,

          fontSize: 16.sp,
          fontFamily: "Gilroy",
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.black, width: 3.0),
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      inputBorder: const OutlineInputBorder(),
    );
  }
}
