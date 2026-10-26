import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/controllers/account_controller.dart';
import 'package:google_test_app/data/controllers/auth_controller.dart';
import 'package:google_test_app/presentation/components/accountCards/accountcards.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/components/header/header.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class Account extends StatelessWidget {
  final controller = Get.put(AccountController());
  final _controller = Get.put(AuthController());
  Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppHeader(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Xmargin(x: 20),
            SizedBox(
              child: CircleAvatar(
                backgroundColor: AppColor.labelColorSignIn.withValues(
                  alpha: 0.3,
                ),
                child: Icon(
                  Icons.person_2_outlined,
                  color: AppColor.white,
                  size: 40.sp,
                ),
              ),
            ),
            Xmargin(x: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _controller.name.value.trim(),
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20.sp,
                        color: Color(0xFF181725),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Xmargin(x: 5),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.edit_outlined,
                        color: AppColor.splashBackgroundColor,
                        size: 16.sp,
                      ),
                    ),
                  ],
                ),
                Ymargin(y: 1),
                Text(
                  _controller.email.value.trim(),
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 16.sp,
                    color: AppColor.labelColorSignIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Ymargin(y: 20),
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1, color: Color(0xFFE2E2E2)),
                itemCount: controller.accountPageList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final control = controller.accountPageList[index];
                  return AccountCards(
                    label: control.accountItems,
                    leadingIcon: control.leadingIcon,
                  );
                },
              ),
              Ymargin(y: 50),
              Center(
                child: Buttons(
                  onPressed: () {
                    _controller.logout();
                  },
                  label: "Logout",
                  labelColor: AppColor.splashBackgroundColor,
                  buttonWidth: 364.w,
                  buttonColor: Color(0xFFF2F3F2),
                  leadingIcon: Icon(
                    Icons.logout_outlined,
                    color: AppColor.splashBackgroundColor,
                    size: 16.sp,
                    weight: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
