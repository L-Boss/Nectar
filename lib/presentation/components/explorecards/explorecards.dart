import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_test_app/presentation/utilities/margin/margin.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';

class ExploreCards extends StatelessWidget {
  final String title;
  final int? index;
  final String image;

  const ExploreCards({
    super.key,
    required this.title,
    required this.image,
    this.index,
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
    final safeIndex = index ?? title.hashCode;
    final backgroundColor = cardColors[safeIndex.abs() % cardColors.length];
    final hslColor = HSLColor.fromColor(backgroundColor);

    final borderColor = hslColor
        .withLightness((hslColor.lightness - 0.15).clamp(0.0, 1.0))
        .toColor();

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18.r),

        border: Border.all(color: borderColor, width: 2.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: image.isNotEmpty
                ? Image.asset(image, fit: BoxFit.contain)
                : Icon(
                    Icons.image_not_supported,
                    size: 40.sp,
                    color: borderColor,
                  ),
          ),
          Ymargin(y: 12),

          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
