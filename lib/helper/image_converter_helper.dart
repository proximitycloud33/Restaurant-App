import 'dart:typed_data';

import 'package:http/http.dart' as http;

class ImageConverterHelper {
  static Future<Uint8List> convertImageToBytes(String imageUrl) async {
    final Uri parsedUri = Uri.parse(imageUrl);
    final response = await http.get(parsedUri);
    final Uint8List bytes;
    if (response.statusCode == 200) {
      bytes = response.bodyBytes;
    } else {
      throw Exception('Failed to get image');
    }
    return bytes;
  }
}
