import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickingUtils {
  final ImagePicker picker = ImagePicker();
  Future<File?> pickImageFromGallery(ImageSource source) async {
    final XFile? pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
}
