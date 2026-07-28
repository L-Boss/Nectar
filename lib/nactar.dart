import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:google_test_app/data/routes/pages.dart';
import 'package:google_test_app/data/routes/paths.dart';
import 'package:google_test_app/presentation/screens/splash/splash.dart';

class Nectar extends StatefulWidget {
  const Nectar({super.key});

  @override
  State<Nectar> createState() => _NectarState();
}

class _NectarState extends State<Nectar> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        initialRoute: PagesPath.SPLASH,
        getPages: Pages.routes,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        // darkTheme: ThemeData.dark(),
        home: child,
      ),

      child: const Splash(),
    );
  }
}
