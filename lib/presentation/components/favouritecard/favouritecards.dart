import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/model/product_model/product_model.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class FavouriteCards extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;
  final ProductModel productdetail;
  const FavouriteCards({
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
        children: [
          SizedBox(
            height: 100.h,
            child: Image.asset(
              productImage,
              fit: BoxFit.contain,
              width: 80.w,
              height: 80.h,
            ),
          ),

          Xmargin(x: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Ymargin(y: 4),
              Text(
                productDescription,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
            ],
          ),

          Xmargin(x: 54),
          Text(
            "\$$productPrice",
            style: TextStyle(
              fontFamily: "Gilroy",
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
              color: AppColor.black,
            ),
          ),
          Xmargin(x: 10),
          Expanded(
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.black,
              size: 16.sp,
              weight: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
