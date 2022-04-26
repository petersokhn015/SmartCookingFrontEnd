import 'dart:convert';
import 'dart:io';
import 'package:app/Utils/AppSettings.dart';
import 'package:http/http.dart' as http;

class CameraService {

  Future<List<String>> submitSubscription(File file, String filename) async {
    List<String> labels = [];
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(GetIngredientsEndPoint),
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'image',
        await file.readAsBytes(),
        filename: filename,
      ),
    );

    final headers = {"Content-type": "multipart/form-data"};
    request.headers.addAll(headers);

    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);

    List<dynamic> result = resJson["labels"];
    for (var e in result) {
      labels.add(e.toString());
    }

    return labels;
  }
}