import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/controllers/product_controllers.dart';
import 'package:google_test_app/presentation/components/buttons/buttons.dart';
import 'package:google_test_app/presentation/components/favouritecard/favouritecards.dart';
import 'package:google_test_app/presentation/components/header/header.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class Favourites extends StatelessWidget {
  final controller = Get.put(ProductController());
  Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppHeader(
        title: Text(
          "Favourite",
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w900,
            fontFamily: "Gilroy",
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: <Widget>[
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1, color: Color(0xFFE2E2E2)),
                itemCount: controller.productList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = controller.productList[index];
                  return FavouriteCards(
                    productName: product.name,
                    productDescription: product.description,
                    productImage: product.image,
                    productPrice: product.price,
                    productdetail: product,
                  );
                },
              ),

              Ymargin(y: 20),
              Buttons(
                onPressed: () {},
                label: "Add all to Cart",
                labelColor: AppColor.grey,
                buttonWidth: 364.w,
                buttonColor: AppColor.splashBackgroundColor,
              ),
              Ymargin(y: 5),
            ],
          ),
        ),
      ),
    );
  }
}
