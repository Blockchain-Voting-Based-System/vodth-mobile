import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/routes/app_router.gr.dart';

class LoginViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Ensure that the widget is still mounted before showing the SnackBar
      if (context.mounted) {
        // Display a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Login successful!'),
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

      // Ensure that the widget is still mounted before navigating
      if (context.mounted) {
        // Redirect to the home page
        context.router.replaceAll([const HomeRoute()]);
      }
    } on FirebaseAuthException catch (e) {
      // Handle login error
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Login failed'),
            backgroundColor: Colors.grey[800], // Gray background
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Handle other errors
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('An unknown error occurred'),
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

  // Future<void> loginWithGoogle() async {
  //   try {
  //     // Handle Google login logic
  //     // Note: This will need additional setup for Google Sign-In
  //   } catch (e) {
  //     // Handle login error
  //     print('Google Login Error: $e');
  //   }
  // }
}
