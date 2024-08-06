import 'dart:io';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class NationalIdOcrService {
  Interpreter? _interpreter;
  List<String>? _labels;
  List<int>? _inputShape;
  List<int>? _outputShape;

  NationalIdOcrService() {
    _loadModel();
    _loadLabels();
  }

  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset(
          'assets/ml_models/vodth_national_id_model.tflite');
      _inputShape = _interpreter!.getInputTensor(0).shape;
      _outputShape = _interpreter!.getOutputTensor(0).shape;
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<void> _loadLabels() async {
    try {
      final labelData =
          await rootBundle.loadString('assets/labels/national_id_labels.txt');
      _labels = labelData
          .split('\n')
          .where((label) => label.trim().isNotEmpty)
          .toList();
    } catch (e) {
      print('Failed to load labels: $e');
    }
  }

  Future<Map<String, String>> predict(File imageFile) async {
    img.Image? image = img.decodeImage(imageFile.readAsBytesSync());

    // Resize image if dimensions do not match expected input shape
    if (image!.height != _inputShape![1] || image.width != _inputShape![2]) {
      print(
          'Resizing image from [${image.height}, ${image.width}] to [${_inputShape![1]}, ${_inputShape![2]}]');
      image = img.copyResize(image,
          height: _inputShape![1], width: _inputShape![2]);
    }

    // Convert the image to the format required by the model
    var inputImage = _convertImageToInputFormat(image);
    print('Input image shape: ${inputImage.length}x${inputImage[0].length}');

    // Define output buffer
    var outputBuffer = List.filled(_outputShape!.reduce((a, b) => a * b), 0.0)
        .reshape(_outputShape!);

    // Run model
    _interpreter!.run(inputImage, outputBuffer);
    print('Output buffer: $outputBuffer');

    // Post-process the output buffer
    return _postProcess(outputBuffer.cast<List<double>>());
  }

  // Convert the image to the required input format
  List<List<List<List<double>>>> _convertImageToInputFormat(img.Image image) {
    final inputHeight = _inputShape![1];
    final inputWidth = _inputShape![2];

    // Convert image to grayscale and normalize
    List<List<List<List<double>>>> input = List.generate(
        1,
        (k) => List.generate(
            inputHeight,
            (i) => List.generate(
                inputWidth, (j) => [(image.getPixel(j, i) & 0xFF) / 255.0])));

    print(
        'Converted input shape: ${input.length}x${input[0].length}x${input[0][0].length}x${input[0][0][0].length}');
    return input;
  }

  // Post-process the output buffer
  Map<String, String> _postProcess(List<List<double>> outputBuffer) {
    final predictedLabels = outputBuffer[0];
    print('Predicted labels: $predictedLabels');
    List<String> results = [];
    for (var i = 0; i < predictedLabels.length; i++) {
      int labelIndex = predictedLabels[i].round();
      print('Predicted label index: $labelIndex');
      if (labelIndex >= 0 && labelIndex < _labels!.length) {
        results.add(_labels![labelIndex]);
      } else {
        results.add('?'); // Handle out-of-bounds index
      }
    }

    // Assuming the order of the results matches your get_personal_information_from_predictions function
    Map<String, String> informations = {
      "identity_num": results.sublist(0, 9).join(),
      "birthdate": results.sublist(9, 15).join(),
      "sex": results[15],
      "expiration_date": results.sublist(16, 22).join(),
      "last_name": results.sublist(22, 32).join().replaceAll("<", " "),
      "first_name": results.sublist(32).join().replaceAll("<", " "),
    };
    print('Extracted information: $informations');
    return informations;
  }
}
