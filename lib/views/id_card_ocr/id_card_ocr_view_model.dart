import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:vodth_mobile/core/base/base_view_model.dart';

class IdCardOcrViewModel extends BaseViewModel {
  Interpreter? _interpreter;
  String _result = "No Result";
  String _extractedText = "";
  Uint8List? _selectedImage;
  final TextRecognizer textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);

  IdCardOcrViewModel() {
    _loadModel();
  }

  String get result => _result;
  String get extractedText => _extractedText;
  Uint8List? get selectedImage => _selectedImage;

  Future<void> _loadModel() async {
    _interpreter = await Interpreter.fromAsset(
        'assets/ml_model/vodth_id_validation_model.tflite');
  }

  Future<bool> classifyID(Uint8List imageData) async {
    if (_interpreter == null) {
      await _loadModel();
    }

    List<dynamic> input = _preprocessImage(imageData);

    var output = List.filled(1, 1).reshape([1, 1]);
    _interpreter!.run(input, output);
    bool isValid = output[0][0] == 1;
    _result = isValid ? "Valid ID" : "Invalid ID";

    _selectedImage = imageData;

    if (isValid) {
      _extractedText = await extractTextFromImage(imageData);
    }

    notifyListeners();
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

  Future<String> extractTextFromImage(Uint8List imageData) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp_image.jpg');
    await tempFile.writeAsBytes(imageData);

    final uri = Uri.parse("http://192.168.1.9:8000/process_image/");
    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', tempFile.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var decodedResponse = jsonDecode(responseData);
      print(decodedResponse['texts'].join(' ').toString());
      return decodedResponse['texts'].join(' ');
    } else {
      print('failed to extract text. Status code: ${response.statusCode}');
      return "Failed to extract text. Status code: ${response.statusCode}";
    }
  }

  @override
  void dispose() {
    textRecognizer.close();
    _interpreter?.close();
    super.dispose();
  }
}
