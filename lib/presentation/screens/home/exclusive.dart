import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/controllers/product_controllers.dart';
import 'package:google_test_app/presentation/components/productcard/productcard.dart';
import 'package:google_test_app/presentation/screens/details/product_details.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class ExclusiveOffer extends StatelessWidget {
  ExclusiveOffer({super.key});
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Exclusive Offer",
              style: TextStyle(
                color: AppColor.locationTitleColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Gilroy",
                fontSize: 24.sp,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "See all",
                style: TextStyle(
                  color: AppColor.splashBackgroundColor,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Gilory",
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
        Ymargin(y: 20),

        Obx(() {
          if (controller.productList.isEmpty) {
            return SizedBox(
              height: 50.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColor.splashBackgroundColor,
                  strokeWidth: 2.5,
                ),
              ),
            );
          }

          return SizedBox(
            height: 255.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                final product = controller.productList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetails(model: product));
                    },
                    child: ProductCard(
                      productImage: product.image,
                      productName: product.name,
                      productDescription: product.description,
                      productPrice: product.price,
                      addToCartOnPressed: () =>
                          controller.handleAddToCart(product),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
