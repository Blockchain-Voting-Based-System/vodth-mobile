import 'package:flutter/material.dart';
import 'package:vodth_mobile/views/private/private_view_model.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({super.key, required this.viewModel});

  final PrivateViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          if (index == 9) {
            return Container();
          } else if (index == 10) {
            return _buildNumberButton(context, '0');
          } else if (index == 11) {
            return Container(); // Empty space in the grid
          } else {
            return _buildNumberButton(context, (index + 1).toString());
          }
        },
      ),
    );
  }

  Widget _buildNumberButton(BuildContext context, String number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(20),
          backgroundColor: const Color.fromRGBO(152, 209, 250, 1),
        ),
        onPressed: () {
          viewModel.onNumberButtonPressed(number);
        },
        child: Text(
          number,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
