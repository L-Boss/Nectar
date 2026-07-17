// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class Xmargin extends StatelessWidget {
  final double x;
  const Xmargin({super.key, required this.x});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x.w);
  }
}

class Ymargin extends StatelessWidget {
  final double y;
  const Ymargin({super.key, required this.y});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y.h);
  }
}
