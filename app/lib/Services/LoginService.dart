import 'package:app/Utils/AppSettings.dart';
import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<bool?> isUserExist(String username, String password) async {
    bool? isUserExist;
    try {
      Response response = await _dio.get(UserEndpoint +
          "UserLoggedIn?username=" +
          username +
          "&password=" +
          password);
      isUserExist = response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return isUserExist;
  }
}
