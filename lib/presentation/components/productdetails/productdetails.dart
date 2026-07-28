import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/controllers/product_controllers.dart'
    show ProductController;
import 'package:google_test_app/model/product_model/product_model.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/components/counter/counter.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/screensizes/screensizes.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class ProductdetailsMockup extends StatelessWidget {
  final controller = Get.put(ProductController());
  final ProductModel productdetail;

  ProductdetailsMockup({super.key, required this.productdetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenSizes.screenWidth(context),
          height: screenSizes.screenWidth(context) * 0.8,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F3F2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.r),
              bottomRight: Radius.circular(25.r),
            ),
          ),
          child: CarouselSlider(
            items: controller.productList.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Image.asset(
                      width: screenSizes.screenWidth(context),
                      height: screenSizes.screenWidth(context) * 0.8,
                      productdetail.image,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                () {};
              },
            ),
          ),
        ),
        Ymargin(y: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productdetail.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                      fontSize: 24.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Ymargin(y: 10),
                  Text(
                    productdetail.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.labelColorSignIn,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.favorite_border_outlined,
                color: AppColor.labelColorSignIn,
              ),
            ],
          ),
        ),
        Ymargin(y: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => AppCounter(
                  value: controller.productQuantities[productdetail.name] ?? 1,
                  onChanged: (newValue) {
                    controller.productQuantities[productdetail.name] = newValue;
                  },
                ),
              ),

              Text(
                "\$${productdetail.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: AppColor.black,
                ),
              ),
            ],
          ),
        ),
        AppExtensions(
          content: productdetail.description,
          label: "Product Detail",
        ),
        AppExtensions(content: productdetail.description, label: "Nutritions"),
        AppExtensions(content: productdetail.description, label: "Reviews"),
        Ymargin(y: 20),
        Buttons(
          onPressed: () {},
          label: "Add to Basket",
          buttonColor: AppColor.splashBackgroundColor,
          labelColor: AppColor.grey,
          buttonWidth: 364.w,
        ),
      ],
    );
  }
}

class AppExtensions extends StatelessWidget {
  final String label;
  final String content;
  const AppExtensions({super.key, required this.content, required this.label});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: AppColor.grey,
      collapsedIconColor: Colors.transparent,
      expandedAlignment: Alignment.centerLeft,
      title: Text(
        label,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          fontFamily: 'Gilroy',
          color: AppColor.black,
        ),
      ),

      trailing: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColor.searchIconColor,
        size: 16.sp,
        weight: 15.0,
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Text(
            content,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              color: AppColor.labelColorSignIn,
            ),
          ),
        ),
      ],
    );
  }
}
