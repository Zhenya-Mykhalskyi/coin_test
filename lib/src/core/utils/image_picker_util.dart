import 'dart:io';

import 'package:image_picker/image_picker.dart';

sealed class ImagePickerUtil {
  static final ImagePicker imagePicker = ImagePicker();

  static Future<File?> pickImage({required ImageSource source}) async {
    try {
      final pickedFile = await imagePicker.pickImage(source: source);
      if (pickedFile == null) return null;

      final File file = File(pickedFile.path);

      final int fileSizeInBytes = await file.length();
      final int fileSizeInMB = fileSizeInBytes ~/ (1024 * 1024);
      if (fileSizeInMB > 10) {
        return null;
      } else {
        return file;
      }
    } catch (e) {
      return null;
    }
  }
}
