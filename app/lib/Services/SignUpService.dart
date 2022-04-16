import 'package:app/Models/User.dart';
import 'package:app/Utils/AppSettings.dart';
import 'package:dio/dio.dart';

class SignUpService {
  final Dio _dio = Dio();

  Future<bool?> canSignUp(String username) async {
    bool? isUserExist;
    try {
      Response response =
          await _dio.get(UserEndpoint + "UserExists?username=" + username);
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

  Future<bool?> SignUp(String username, String password) async {
    bool? isSignedIn;
    try {
      bool? userExists = await canSignUp(username);
      if (userExists == true) {
        return false;
      } else {
        User user = User(id: 1, username: username, password: password);
        Response response =
            await _dio.post(UserEndpoint + "User", data: user.toJson());
        if (response.statusCode == 200) {
          isSignedIn = true;
        } else {
          isSignedIn = false;
        }
      }
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
    return isSignedIn;
  }
}
