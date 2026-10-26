import 'package:supabase_flutter/supabase_flutter.dart';

class Services {
  final _services = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _services.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    return await _services.auth.signUp(
      password: password,
      email: email,
      data: {'display_name': name},
    );
  }

  Future<void> signOut() async {
    await _services.auth.signOut();
  }
}
