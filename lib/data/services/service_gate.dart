import 'package:flutter/material.dart';
import 'package:google_test_app/presentation/components/navigation/navigation.dart';
import 'package:google_test_app/presentation/screens/login/login.dart';
import 'package:google_test_app/presentation/utilities/styles/color/color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceGate extends StatelessWidget {
  const ServiceGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: AppColor.black.withValues(alpha: 0.4),
            body: Center(
              child: CircularProgressIndicator(
                color: AppColor.splashBackgroundColor,
                strokeWidth: 2.5,
              ),
            ),
          );
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          return AppPageNavigation();
        } else {
          return Login();
        }
      },
    );
  }
}
