import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/controllers/product_controllers.dart';
import 'package:google_test_app/presentation/components/explorecards/explorecards.dart';
import 'package:google_test_app/presentation/components/header/header.dart';
import 'package:google_test_app/presentation/components/searchbar/searchbar.dart'
    show AppSearchBar;
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class Explore extends StatelessWidget {
  Explore({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppHeader(
        title: Text(
          "Find Product",
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w900,
            fontFamily: "Gilroy",
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: <Widget>[
              Center(child: AppSearchBar()),
              Ymargin(y: 20),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final category = controller.categoryList[index];
                  return ExploreCards(
                    title: category.categoryName,
                    image: category.image,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
