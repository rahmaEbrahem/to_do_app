import 'package:dio/dio.dart';
import 'package:to_do_app/core/helper/app_preferences.dart';
import 'package:to_do_app/core/network/dio_factory.dart';
import 'package:to_do_app/core/network/endpoints.dart';
import 'package:to_do_app/features/auth/login_screen/data/models/login_request_body.dart';

class LoginRepo {
  static Future<LoginResponse?> login(LoginRequestBody body) async {
    try {
      final response = await DioFactory.dio.post(
        Endpoints.login,
        data: body.toJson(),
      );

      if (response.statusCode == 200) {
        final String token = response.data['data']['token'];

        final String name = response.data['data']['user']['name'];

        await AppPreferences.saveToken(token: token);

        await AppPreferences.saveUserName(name: name);

        return LoginResponse(token: token, name: name);
      }

      return null;
    } on DioException catch (e) {
      print("Server Error: ${e.response?.data}");
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
