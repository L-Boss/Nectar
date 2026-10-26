import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/controllers/product_controllers.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/components/cartcard/cartcard.dart';
import 'package:google_test_app/presentation/components/header/header.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class Cart extends StatelessWidget {
  final controller = Get.put(ProductController());

  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppHeader(
        title: Text(
          "My Cart",
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w900,
            fontFamily: "Gilroy",
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final product = controller.productList[index];

                return CartCard(
                  productName: product.name,
                  productDescription: product.description,
                  productImage: product.image,
                  productPrice: product.price,
                  productdetail: product,
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 1, color: Color(0xFFE2E2E2)),
              itemCount: controller.productList.length,
            ),
            Ymargin(y: 10),
            Buttons(
              onPressed: () {},
              label: "Go to Checkout",
              labelColor: AppColor.grey,
              buttonWidth: 364.w,
              buttonColor: AppColor.splashBackgroundColor,
              actions: Container(
                height: 22.h,
                width: 58.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColor.black.withValues(alpha: 0.2),
                ),
                child: Center(
                  child: Text(
                    "\$155.00",
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
            Ymargin(y: 5),
          ],
        ),
      ),
    );
  }
}
