import 'dart:typed_data';

import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:image/image.dart' as img;

class IdCardValidationViewModel extends BaseViewModel {
  Interpreter? _interpreter;
  String _result = "No Result";
  Uint8List? _selectedImage;

  IdCardValidationViewModel() {
    _loadModel();
  }

  String get result => _result;
  Uint8List? get selectedImage => _selectedImage;

  Future<void> _loadModel() async {
    _interpreter = await Interpreter.fromAsset(
        'assets/ml_model/vodth_id_validation_model.tflite');
  }

  Future<void> classifyID(Uint8List imageData) async {
    if (_interpreter == null) {
      await _loadModel();
    }

    List<dynamic> input = _preprocessImage(imageData);

    var output = List.filled(1, 1).reshape([1, 1]);
    _interpreter!.run(input, output);
    _result = output[0][0] == 1 ? "Valid ID" : "Invalid ID";

    _selectedImage = imageData;

    notifyListeners();
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
}
