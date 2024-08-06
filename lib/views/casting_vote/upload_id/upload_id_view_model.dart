import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/services/id_card_classifier_service.dart';
import 'package:vodth_mobile/core/services/ml_ocr_service.dart';
import 'package:vodth_mobile/core/services/national_id_ocr_service.dart';

class UploadIdViewModel extends BaseViewModel {
  final String cardType;
  final IdCardClassifierService _idCardClassifierService =
      IdCardClassifierService();
  final StudentCardOcrService _studentCardOcrService = StudentCardOcrService();
  final NationalIdOcrService nationalIdOcrService = NationalIdOcrService();

  String _result = "No Result";
  String _extractedText = "";
  Uint8List? _selectedImage;
  bool isValid = false;
  bool isInvalid = false;
  bool hasUploaded = false;

  String get result => _result;
  String get extractedText => _extractedText;
  Uint8List? get selectedImage => _selectedImage;

  UploadIdViewModel({required this.cardType}) {
    _loadModel();
  }

  Future<void> _loadModel() async {
    await _idCardClassifierService.loadModel(cardType);
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      hasUploaded = true;
      PlatformFile file = result.files.first;
      Uint8List fileBytes;

      if (file.bytes != null) {
        fileBytes = file.bytes!;
      } else {
        // Read the file bytes manually
        File filePath = File(file.path!);
        fileBytes = await filePath.readAsBytes();
      }
      if (cardType == 'student_id') {
        await classifyID(fileBytes);
      } else if (cardType == 'national_id') {
        print('National ID');
        File imageFile = File(file.path!);
        Map<String, String> ocrResults =
            await nationalIdOcrService.predict(imageFile);
        print('OCR Results: $ocrResults');
      }

      setSelectedImage(fileBytes);
      notifyListeners();
    }
  }

  void setSelectedImage(Uint8List image) {
    _selectedImage = image;
    notifyListeners();
  }

  Future<bool> classifyID(Uint8List imageData) async {
    isValid = await _idCardClassifierService.classifyID(imageData);
    _result = isValid ? "Valid ID" : "Invalid ID";

    if (isValid) {
      isInvalid = false;
      _extractedText =
          await _studentCardOcrService.extractTextFromImage(imageData);

      final hashedExtractedText = hashString(_extractedText);

      print(hashedExtractedText);
    } else {
      isInvalid = true;
    }

    _selectedImage = imageData;

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
