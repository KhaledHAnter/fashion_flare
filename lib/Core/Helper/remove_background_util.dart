import 'dart:io';

import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

Future<File?> removeBackground(File imageFile) async {
  const apiKey =
      'ApZ9RRq5PcU7D9z22VWtx5M5'; // Replace with your RemoveBG API key
  final url = Uri.parse('https://api.remove.bg/v1.0/removebg');

  try {
    // Prepare the request
    var request = http.MultipartRequest('POST', url);
    request.headers['X-Api-Key'] = apiKey;

    // Add the image file to the request
    request.files.add(
      await http.MultipartFile.fromPath('image_file', imageFile.path),
    );

    // Send the request to RemoveBG API
    var response = await request.send();

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Get the bytes from the response
      var bytes = await response.stream.toBytes();

      // Generate a unique file name using a UUID
      String uniqueFileName = const Uuid().v4(); // Generates a unique ID
      String tempDir =
          Directory.systemTemp.path; // Using the system's temporary directory
      String filePath =
          '$tempDir/no_bg_image_$uniqueFileName.png'; // Unique file path

      // Write the bytes to the file
      File file = File(filePath);
      await file.writeAsBytes(bytes);

      return file; // Return the file with background removed
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Exception occurred during RemoveBG API call: $e');
    return null;
  }
}
