import 'package:flutter/material.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/data/controllers/navigation_controller.dart';
import 'package:google_test_app/presentation/screens/account/account.dart';
import 'package:google_test_app/presentation/screens/cart/cart.dart';
import 'package:google_test_app/presentation/screens/explore/explore.dart';
import 'package:google_test_app/presentation/screens/favourites/favourites.dart';
import 'package:google_test_app/presentation/screens/home/home.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navCtrl = Get.find<NavigationController>();

    const Color activeColor = AppColor.splashBackgroundColor;
    const Color inactiveColor = Color(0xFF181725);

    Widget buildNavIcon(String assetPath, int targetIndex) {
      final bool isActive = navCtrl.currentIndex.value == targetIndex;
      return SvgPicture.asset(
        assetPath,
        width: 24.w,
        height: 24.h,

        colorFilter: ColorFilter.mode(
          isActive ? activeColor : inactiveColor,
          BlendMode.srcIn,
        ),
      );
    }

    TextStyle getLabelStyle(int targetIndex) {
      final bool isActive = navCtrl.currentIndex.value == targetIndex;
      return TextStyle(
        fontSize: 12.sp,
        fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
        color: isActive ? activeColor : inactiveColor,
      );
    }

    return Obx(
      () => NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                color: activeColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              );
            }
            return TextStyle(
              color: inactiveColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            );
          }),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
          ),
          child: NavigationBar(
            selectedIndex: navCtrl.currentIndex.value,
            onDestinationSelected: (index) {
              navCtrl.changeIndex(index);
            },
            backgroundColor: Colors.white,
            destinations: [
              NavigationDestination(
                icon: buildNavIcon(AppAssetPaths.shop, 0),
                label: 'Shop',
              ),
              NavigationDestination(
                icon: buildNavIcon(AppAssetPaths.explore, 1),
                label: 'Explore',
              ),
              NavigationDestination(
                icon: buildNavIcon(AppAssetPaths.cart, 2),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: buildNavIcon(AppAssetPaths.favourite, 3),
                label: 'Favourites',
              ),
              NavigationDestination(
                icon: buildNavIcon(AppAssetPaths.account, 4),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppPageNavigation extends StatelessWidget {
  final NavigationController navCtrl = Get.put(NavigationController());

  AppPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,

      body: Obx(
        () => IndexedStack(
          index: navCtrl.currentIndex.value,
          children: [Home(), Explore(), Cart(), Favourites(), Account()],
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(),
    );
  }
}
