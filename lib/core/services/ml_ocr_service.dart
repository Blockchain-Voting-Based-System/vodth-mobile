import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class StudentCardOcrService {
  Future<String> extractTextFromImage(Uint8List imageData) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp_image.jpg');
    await tempFile.writeAsBytes(imageData);

    final uri = Uri.parse("http://172.20.10.3:8000/process_image/");
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
}
