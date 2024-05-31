import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/id_card_model.dart';

class IdCardUploadViewModel extends BaseViewModel {
  File? image;
  String extractedText = "";

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }

    notifyListeners();
  }

  Future<void> uploadImage() async {
    if (image == null) return;

    try {
      // Compress the image before uploading
      final compressedImage = await compressImage(image!);

      var dio = Dio();
      var formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(compressedImage.path),
      });

      var response = await dio.post(
        "http://localhost:3000/vodth/api/v1/id-card-upload",
        data: formData,
      );

      final idCardModel = IdCardModel.fromJson(response.data);
      print('Parsed data: ${idCardModel.data}');

      if (response.statusCode == 200) {}
    } catch (e) {
      print('Upload Error: $e');
    }
  }

  Future<File> compressImage(File file) async {
    final tempDir = await getTemporaryDirectory();
    final targetPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    var compressedImage = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 85,
    );

    return File(compressedImage!.path);
  }
}
