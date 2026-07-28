import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/presentation/components/carousel/carousel.dart';
import 'package:google_test_app/presentation/components/header/header.dart';
import 'package:google_test_app/presentation/components/searchbar/searchbar.dart';
import 'package:google_test_app/presentation/screens/home/bestselling.dart';
import 'package:google_test_app/presentation/screens/home/exclusive.dart';
import 'package:google_test_app/presentation/screens/home/groceries.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssetPaths.coloredCarrot, width: 26.w, height: 31.h),
            Ymargin(y: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColor.homeHeaderColor,
                  size: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                Xmargin(x: 6),
                Text(
                  "Dhaka, Banassre",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    color: AppColor.homeHeaderColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: AppSearchBar()),
              Ymargin(y: 20),
              BannerSlider(),
              Ymargin(y: 30),
              ExclusiveOffer(),
              Ymargin(y: 30),
              BestSelling(),
              Ymargin(y: 30),
              Groceries(),
            ],
          ),
        ),
      ),
    );
  }
}
