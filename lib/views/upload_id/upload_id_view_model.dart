import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/services/id_card_classifier_service.dart';
import 'package:vodth_mobile/core/services/national_id_ocr_service.dart';
import 'package:vodth_mobile/core/services/student_id_ocr_service.dart';

class UploadIdViewModel extends BaseViewModel {
  final String cardType;
  final IdCardClassifierService _idCardClassifierService =
      IdCardClassifierService();
  final StudentCardOcrService _studentCardOcrService = StudentCardOcrService();
  final NationalIdOcrService nationalIdOcrService = NationalIdOcrService();

  String _result = "No Result";
  String _extractedText = "";
  Uint8List? _selectedImage;

  UploadIdViewModel({required this.cardType}) {
    _loadModel();
  }

  String get result => _result;
  String get extractedText => _extractedText;
  Uint8List? get selectedImage => _selectedImage;

  Future<void> _loadModel() async {
    await _idCardClassifierService.loadModel(cardType);
  }

  void setSelectedImage(Uint8List image) {
    _selectedImage = image;
    notifyListeners();
  }

  Future<bool> classifyID(Uint8List imageData) async {
    bool isValid = await _idCardClassifierService.classifyID(imageData);
    _result = isValid ? "Valid ID" : "Invalid ID";

    _selectedImage = imageData;

    if (isValid) {
      _extractedText =
          await _studentCardOcrService.extractTextFromImage(imageData);

      final hashedExtractedText = hashString(_extractedText);

      print(hashedExtractedText);
    }

    notifyListeners();
    return isValid;
  }

  String hashString(String input) {
    var bytes = utf8.encode(input); // Convert the input string to bytes
    var digest = sha256.convert(bytes); // Hash the bytes using SHA-256

    return digest.toString(); // Convert the digest to a string
  }

  @override
  void dispose() {
    _idCardClassifierService.dispose();
    super.dispose();
  }
}
