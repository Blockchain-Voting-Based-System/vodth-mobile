import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class IdCardClassifierService {
  Interpreter? _interpreter;
  late List<int> inputShape;
  late List<int> outputShape;

  Future<void> loadModel(String cardType) async {
    if (cardType == 'student_id') {
      _interpreter = await Interpreter.fromAsset(
          'assets/ml_model/vodth_id_validation_model.tflite');
    } else if (cardType == 'national_id') {
      _interpreter = await Interpreter.fromAsset(
          'assets/ml_model/vodth_national_id_model.tflite');
    }

    // Load shapes of the model
    inputShape = _interpreter!.getInputTensor(0).shape;
    outputShape = _interpreter!.getOutputTensor(0).shape;
  }

  Future<bool> classifyID(Uint8List imageData) async {
    if (_interpreter == null) {
      throw Exception("Model not loaded");
    }

    List<dynamic> input = _preprocessImage(imageData);

    var output = List.filled(1, 1).reshape([1, 1]);
    _interpreter!.run(input, output);
    bool isValid = output[0][0] == 1;

    return isValid;
  }

  List<List<List<List<double>>>> _preprocessImage(Uint8List imageData) {
    img.Image image = img.decodeImage(imageData)!;
    img.Image resizedImage = img.copyResize(image, width: 256, height: 256);

    // Create a 4D list to store the image data
    List<List<List<List<double>>>> input = List.generate(
      1,
      (i) => List.generate(
        256,
        (y) => List.generate(
          256,
          (x) => [
            img.getRed(resizedImage.getPixel(x, y)) / 255.0,
            img.getGreen(resizedImage.getPixel(x, y)) / 255.0,
            img.getBlue(resizedImage.getPixel(x, y)) / 255.0,
          ],
        ),
      ),
    );

    return input;
  }

  void dispose() {
    _interpreter?.close();
  }
}
