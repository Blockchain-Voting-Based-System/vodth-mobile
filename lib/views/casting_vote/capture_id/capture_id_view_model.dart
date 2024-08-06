import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/services/id_card_classifier_service.dart';
import 'package:vodth_mobile/core/services/ml_ocr_service.dart';
import 'package:vodth_mobile/core/services/national_id_ocr_service.dart';

class CaptureIdViewModel extends BaseViewModel {
  CaptureIdViewModel() {
    _loadModel();
  }

  final IdCardClassifierService _idCardClassifierService = IdCardClassifierService();
  final StudentCardOcrService _studentCardOcrService = StudentCardOcrService();
  final NationalIdOcrService nationalIdOcrService = NationalIdOcrService();

  String _result = "No Result";
  String _extractedText = "";
  Uint8List? _selectedImage;
  bool isValid = false;
  bool isInvalid = false;
  bool hasUploaded = false;

  CameraController? _controller;
  List<CameraDescription>? cameras;
  CameraDescription? camera;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;
  CameraController? get controller => _controller;

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        camera = cameras![0];
        _controller = CameraController(camera!, ResolutionPreset.high);
        await _controller!.initialize();
        _isInitialized = true;
        notifyListeners();
      }
    } catch (e) {
      _isInitialized = false;
      notifyListeners();
    }
  }

  Future<void> _loadModel() async {
    await _idCardClassifierService.loadModel('student_id');
  }

  Future<void> takePicture(BuildContext context) async {
    if (!_controller!.value.isInitialized) {
      return;
    }

    try {
      final XFile imageFile = await _controller!.takePicture();
      final imageBytes = await imageFile.readAsBytes();
      bool isValid = await classifyID(imageBytes);

      if (isValid) {
        print('is valid');
        await _studentCardOcrService.extractTextFromImage(imageBytes);
      } else {
        print('is invalid');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> classifyID(Uint8List imageData) async {
    isValid = await _idCardClassifierService.classifyID(imageData);
    _result = isValid ? "Valid ID" : "Invalid ID";

    if (isValid) {
      isInvalid = false;
      _extractedText = await _studentCardOcrService.extractTextFromImage(imageData);

      final hashedExtractedText = hashString(_extractedText);

      print('Hashed Texts: $hashedExtractedText');
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
    _controller?.dispose();
    super.dispose();
  }
}
