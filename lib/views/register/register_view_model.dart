import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';

class RegisterViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(BuildContext context, String email, String password) async {
    try {
      // Register with FirebaseAuth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Ensure that the widget is still mounted before showing the SnackBar
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Registration successful!'),
            backgroundColor: Colors.grey[800], // Gray background
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      }

      // Wait for 3 seconds before redirecting
      await Future.delayed(const Duration(seconds: 3));
      if (context.mounted) {
        context.router.replaceAll([const HomeRoute()]);
      }
    } catch (e) {
      // Handle registration error
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: ${e.toString()}'),
            backgroundColor: Colors.grey[800], // Gray background
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  // Future<void> registerWithGoogle() async {
  //   try {
  //     // Handle Google registration logic
  //     // Note: This will need additional setup for Google Sign-In
  //   } catch (e) {
  //     // Handle registration error
  //     print('Google Registration Error: $e');
  //   }
  // }
}
