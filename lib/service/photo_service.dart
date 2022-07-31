import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:gtech1/models/photo_model.dart';
import 'package:gtech1/constants.dart';

class PhotoService {
  Future<List<PhotoModel>?> getModel() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.photoEndpoints);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<PhotoModel> _model = photoModelFromJson(response.body);
      return _model;
    } else {
      print("istek başarısız oldu => ${response.statusCode}");
    }
  }
}
