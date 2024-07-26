import 'package:tflite_flutter/tflite_flutter.dart';

class IDClassifier {
  late Interpreter _interpreter;

  IDClassifier() {
    _loadModel();
  }

  void _loadModel() async {
    _interpreter = await Interpreter.fromAsset('your_model.tflite');
  }

  List<dynamic> classify(List<dynamic> input) {
    final List<dynamic> output = List.filled(1, 0).reshape([1, 1]);
    _interpreter.run(input, output);
    return output;
  }
}
