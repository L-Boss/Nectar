import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_test_app/nactar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZkaXNnZ25jd2tzdWhtY3BxYXZlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4NjU1MDM2OSwiZXhwIjoyMTAyMTI2MzY5fQ.rLqpXyeHAMbvCixUXK3-MiIMBRpxmwsHyYY-BRqNLAo",
    url: "https://fdisggncwksuhmcpqave.supabase.co",
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(enabled: true, builder: (context) => const Nectar()));
}
