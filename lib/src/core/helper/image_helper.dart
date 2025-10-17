import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;

class ImageHelper {
  static File compressAndResizeImage(File file) {
    final imageBytes = file.readAsBytesSync();
    final image = img.decodeImage(imageBytes);

    if (image == null) {
      throw Exception("Failed to decode image for compression.");
    }

    final int width, height;
    if (image.width > image.height) {
      width = 800;
      height = (image.height / image.width * 800).round();
    } else {
      height = 800;
      width = (image.width / image.height * 800).round();
    }

    final resizedImage = img.copyResize(image, width: width, height: height);
    final compressedBytes = img.encodeJpg(resizedImage, quality: 85);
    final newPath = path.join(path.dirname(file.path), '${path.basenameWithoutExtension(file.path)}_compressed.jpg');
    final compressedFile = File(newPath)..writeAsBytesSync(compressedBytes);
    return compressedFile;
  }
}
