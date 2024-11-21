import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import 'app_log_util.dart';

class ImageUtil {
  Future<File> onConvertImgToJPG(XFile file, {bool isResize = true}) async {
    final originalImageBytes = await file.readAsBytes();
    img.Image? originalImage =
        img.decodeImage(Uint8List.fromList(originalImageBytes));

    if (originalImage != null) {
      // Convert the image to JPEG format
      // Get the width and height of the original image

      // Calculate the maximum dimension (width or height)
      if (isResize) {
        const int targetSize = 1200;
        final double maxDimension =
            max(originalImage.width, originalImage.height).toDouble();
        final double ratioScale = max(maxDimension / targetSize, 1);
        Log.d('originalImage.height: ${originalImage.height} ');
        Log.d('originalImage.width: ${originalImage.width} ');
        Log.d('ratioScale: $ratioScale ');
        originalImage = img.copyResize(
          originalImage,
          width: originalImage.width ~/ ratioScale,
          height: originalImage.height ~/ ratioScale,
        );
      }
      final jpegImage = img.encodeJpg(originalImage);

      // Create a temporary file to hold the JPEG image data
      final tempDir = await Directory.systemTemp.createTemp();
      final jpegImageFile = File('${tempDir.path}/converted_image.jpg');
      await jpegImageFile.writeAsBytes(jpegImage);
      final int fileSize = jpegImageFile.lengthSync();
      Log.d('File Size: $fileSize bytes');

      return jpegImageFile;
    } else {
      throw Exception('Failed to decode the original image.');
    }
  }
}
