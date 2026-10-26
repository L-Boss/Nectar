import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/controllers/product_controllers.dart';
import 'package:google_test_app/model/product_model/product_model.dart';
import 'package:google_test_app/presentation/components/counter/counter.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class CartCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;

  final controller = Get.put(ProductController());
  final ProductModel productdetail;

  CartCard({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.productPrice,
    required this.productdetail,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 100.h,
            child: Image.asset(
              productImage,
              fit: BoxFit.contain,
              width: 80.w,
              height: 80.h,
            ),
          ),
          Xmargin(x: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                productName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              Ymargin(y: 4),
              Text(
                productDescription,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
              Ymargin(y: 12),
              AppCounter(
                value: controller.productQuantities[productdetail.name] ?? 1,
                onChanged: (newValue) {
                  controller.productQuantities[productdetail.name] = newValue;
                },
              ),
            ],
          ),
          Xmargin(x: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.close_rounded,
                    size: 16.sp,
                    weight: 1,
                    color: Color(0xFFB3B3B3),
                  ),
                ),
                Ymargin(y: 40),
                Text(
                  "\$$productPrice",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
