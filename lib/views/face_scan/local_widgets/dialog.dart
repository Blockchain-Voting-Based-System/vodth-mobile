import 'package:flutter/material.dart';

class Dislog extends StatelessWidget {
  const Dislog({super.key, this.success = false});

  final bool success;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildDialogLabel(context, success),
        buildDialogMessage(context, success),
        buildDialogButton(context, success),
      ],
    );
  }

  Widget buildDialogLabel(BuildContext context, bool success) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        success ? 'Success' : 'Incorrect',
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  Widget buildDialogMessage(BuildContext context, bool success) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        success
            ? 'Your face scan was successful!'
            : ' Your face scan failed. Please try again.',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  Widget buildDialogButton(BuildContext context, bool success) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: Text(success ? 'Continue' : 'Return',
            style: Theme.of(context).textTheme.displaySmall),
      ),
    );
  }
}
