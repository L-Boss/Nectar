import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_test_app/nactar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(enabled: false, builder: (context) => const Nectar()));
}
