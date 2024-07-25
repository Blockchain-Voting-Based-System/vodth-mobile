import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';

class NationalIdCardOcrViewModel extends BaseViewModel {
  Interpreter? _interpreter;
  final String _result = "No";
  Uint8List? _selectedImage;

  NationalIdCardOcrViewModel() {
    _loadModel();
  }

  String get result => _result;
  Uint8List? get selectedImage => _selectedImage;

  Future<void> _loadModel() async {
    _interpreter = await Interpreter.fromAsset(
        'assets/ml_model/vodth_national_id_ocr_model.tflite');
  }

  // Future<void> ocrNationalID(Uint8List imageData) async {
  Future<NationalIDInformation> ocrNationalID(Uint8List imageData) async {
    if (_interpreter == null) {
      await _loadModel();
    }

    List<dynamic> input = _preprocessImage(imageData);

    // var output = List.filled(1, 1).reshape([1, 1]);
    var output = List.filled(1 * 10, 0).reshape([1, 10]);
    _interpreter!.run(input, output);
    // _result = output[0][0] == 1 ? "" : "";

    _selectedImage = imageData;

    var result = _postprocessOutput(output);
    return NationalIDInformation.fromMap(result);

    // var informations = _postprocessOutput(output);
    // return NationalIDInformation.fromMap(informations);

    // notifyListeners();
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

  Map<String, dynamic> _postprocessOutput(List<dynamic> output) {
    return {
      'First_name': '',
      'Last_name': '',
    };
  }
}

class NationalIDInformation {
  final Map<String, dynamic> result;

  NationalIDInformation.fromMap(this.result);
}
