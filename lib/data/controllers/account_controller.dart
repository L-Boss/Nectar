import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/state_manager.dart';
import 'package:google_test_app/model/account_model/account_model.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class AccountController extends GetxController {
  var accountPageList = <AccountModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    accountList();
  }

  void accountList() {
    accountPageList.assignAll([
      AccountModel(
        accountItems: "Orders",
        leadingIcon: Icon(
          Icons.shopping_bag_outlined,
          color: AppColor.black,
          size: 20.sp,
        ),
      ),
      AccountModel(
        accountItems: "My Details",
        leadingIcon: Icon(
          Icons.credit_card_outlined,
          color: AppColor.black,
          size: 20.sp,
        ),
      ),
      AccountModel(
        accountItems: "Delivery Address",
        leadingIcon: Icon(
          Icons.location_on_outlined,
          color: AppColor.black,
          size: 20.sp,
        ),
      ),
      AccountModel(
        accountItems: "Payment Methods",
        leadingIcon: Icon(
          Icons.payment_outlined,
          color: AppColor.black,
          size: 20.sp,
        ),
      ),
      AccountModel(
        accountItems: "Promo Codes",
        leadingIcon: Icon(
          Icons.gif_box_outlined,
          color: AppColor.black,
          size: 20.sp,
        ),
      ),
      AccountModel(
        accountItems: "Notifications",
        leadingIcon: Icon(
          Icons.notifications_outlined,
          color: AppColor.black,
          size: 20.sp,
        ),
      ),
      AccountModel(
        accountItems: "Help",
        leadingIcon: Icon(
          Icons.shopping_bag_outlined,
          color: AppColor.black,
          size: 20.sp,
        ),
      ),
      AccountModel(
        accountItems: "About",
        leadingIcon: Icon(
          Icons.help_center_outlined,
          color: AppColor.black,
          size: 20.sp,
        ),
      ),
    ]);
  }
}
