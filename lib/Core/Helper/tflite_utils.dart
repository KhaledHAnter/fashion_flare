import 'dart:io';

import 'package:tflite_v2/tflite_v2.dart';

class TfliteUtils {
  loadmodel(String model, String labels) async {
    await Tflite.loadModel(
      model: model,
      labels: labels,
    );
  }

  Future<String?> detectimage(File image) async {
    String detectedLabel = '';
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    detectedLabel = recognitions![0]['label'].toString();
    // dataList = List<Map<String, dynamic>>.from(jsonDecode(v));

    return detectedLabel;
  }

  close() {
    Tflite.close();
  }
}
