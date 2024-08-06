import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/providers/user_provider.dart';

class AccountViewModel extends BaseViewModel {
  String? userEmail(BuildContext context) {
    return Provider.of<UserProvider>(context, listen: true).userEmail;
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await Provider.of<UserProvider>(context, listen: false).signOut();

      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Sign out failed'),
          backgroundColor: Colors.grey[800],
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
