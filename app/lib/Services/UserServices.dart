import 'package:app/Utils/AppSettings.dart';
import 'package:dio/dio.dart';

class UserServices {
  Dio _dio = Dio();

  Future<int> getUserId(String username) async {
    Response response =
        await _dio.get(UserEndpoint + "GetIdOfUser/" + username);

    if (response.statusCode == 200) {
      return response.data;
    }

    return -1;
  }
}
