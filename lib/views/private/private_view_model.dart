import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';

class PrivateViewModel extends BaseViewModel {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  void onNumberButtonPressed(String number) {
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        controller.text = number;
        break;
      }
    }
  }

  Future<void> validateCode(BuildContext context) async {
    const correctCode = '1234';
    final enteredCode = controllers.map((controller) => controller.text).join();

    if (enteredCode == correctCode) {
      await _showCustomDialog(
        context: context,
        title: 'Success',
        content: 'Code entered successfully!',
        buttonText: 'Continue',
        onPressed: () {
          Navigator.of(context).pop();
          for (var controller in controllers) {
            controller.clear();
          }
        },
      );
    } else {
      await _showCustomDialog(
        context: context,
        title: 'Incorrect',
        content: 'Incorrect code, please try again.',
        buttonText: 'Return',
        onPressed: () {
          Navigator.of(context).pop();
          for (var controller in controllers) {
            controller.clear();
          }
        },
      );
    }
  }

  Future<void> _showCustomDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String buttonText,
    required VoidCallback onPressed,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.blue,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  content,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in controllers) {
      controller.dispose();
    }
  }
}
