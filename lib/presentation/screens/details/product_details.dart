import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/route_manager.dart';
import 'package:google_test_app/model/product_model/product_model.dart';
import 'package:google_test_app/presentation/components/header/header.dart';
import 'package:google_test_app/presentation/components/productdetails/productdetails.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel model;
  const ProductDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppHeader(
        leadingIcon: InkWell(
          radius: 12.r,
          borderRadius: BorderRadius.circular(18.r),
          onTap: Get.back,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: 22.sp,
            color: Color(0xFF212121),
          ),
        ),
        lastIcon: InkWell(
          borderRadius: BorderRadius.circular(18.r),
          onTap: () {},
          child: Icon(
            Icons.download_rounded,
            color: Color(0xFF181725),
            size: 22.sp,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: ProductdetailsMockup(productdetail: model),
      ),
    );
  }
}
