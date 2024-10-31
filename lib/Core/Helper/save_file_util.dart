import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class SaveFileUtil {
  Future<File?> saveImageLocally(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final String imagePath =
        path.join(directory.path, path.basename(imageFile.path));
    return await imageFile.copy(imagePath);
  }
}
