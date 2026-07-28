import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class ProductCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String? productCategory;
  final Function() addToCartOnPressed;

  const ProductCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    this.productCategory,
    required this.addToCartOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0.0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
            side: const BorderSide(color: AppColor.borderColor, width: 2.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: 173.w,
            height: 248.h,
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Image.asset(productImage, fit: BoxFit.contain),
                  ),
                ),

                Ymargin(y: 12),

                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Ymargin(y: 4),
                Text(
                  productDescription,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),

                Ymargin(y: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$productPrice",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: addToCartOnPressed,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColor.splashBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.r),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppColor.white,
                          size: 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GroceryCard extends StatelessWidget {
  final String cardName;
  final String cardImage;
  final int index;
  const GroceryCard({
    super.key,
    required this.cardImage,
    required this.cardName,
    required this.index,
  });
  static const List<Color> cardColors = [
    Color.fromARGB(255, 180, 240, 207),
    Color.fromARGB(255, 243, 210, 181),
    Color.fromARGB(255, 235, 210, 183),
    Color.fromARGB(255, 183, 119, 196),
    Color.fromARGB(255, 163, 100, 100),
  ];

  @override
  Widget build(BuildContext context) {
    final backgroundColor = cardColors[index % cardColors.length];
    return Container(
      height: 105.h,
      width: 248.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70.w,
            height: 70.h,
            child: Image.asset(cardImage, fit: BoxFit.contain),
          ),

          Xmargin(x: 15),

          Expanded(
            child: Text(
              cardName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF3E423F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
