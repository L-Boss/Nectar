import 'package:get/get.dart';
import 'package:google_test_app/data/services/services.dart';
import 'package:google_test_app/presentation/components/navigation/navigation.dart';
import 'package:google_test_app/presentation/screens/login/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final Services services = Services();

  final RxString password = ''.obs;
  final RxString email = ''.obs;
  final RxString name = ''.obs;
  final RxBool isLoading = false.obs;
  final RxnString loggedInEmail = RxnString();
  final RxnString loggedInName = RxnString();

  @override
  void onInit() {
    super.onInit();
    _updateCurrentUser();
  }

  void _updateCurrentUser() {
    final User? user = Supabase.instance.client.auth.currentUser;

    if (user != null) {
      loggedInEmail.value = user.email;

      loggedInName.value = user.userMetadata?['display_name'] as String?;
    } else {
      loggedInEmail.value = null;
      loggedInName.value = null;
    }
  }

  void resetFields() {
    password.value = '';
    email.value = '';
    name.value = '';
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      await services.signOut();
      _updateCurrentUser();
      Get.offAll(() => Login());
    } catch (e) {
      Get.snackbar("Error", e.toString().trim());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    if (email.value.trim().isEmpty || password.value.trimLeft().isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    try {
      isLoading.value = true;
      await services.signInWithEmailAndPassword(
        email.value.trim(),
        password.value.trim(),
      );

      _updateCurrentUser();
      resetFields();

      Get.off(() => AppPageNavigation());
      Get.snackbar("Success", "Welcome back!");
    } catch (e) {
      Get.snackbar("Login Failed", e.toString().trim());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup() async {
    if (email.value.trim().isEmpty || password.value.trimLeft().isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    try {
      isLoading.value = true;
      await services.signUpWithEmailAndPassword(
        email.value.trim(),
        password.value.trim(),
        name.value.trim(),
      );

      resetFields();
      Get.off(() => Login());
      Get.snackbar(
        "Success",
        "Account created successfully! Confirm your account in your email",
      );
    } catch (e) {
      Get.snackbar("Signup Failed", e.toString().trim());
    } finally {
      isLoading.value = false;
    }
  }
}
