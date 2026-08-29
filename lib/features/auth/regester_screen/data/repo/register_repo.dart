import 'package:dio/dio.dart';
import 'package:to_do_app/core/helper/app_preferences.dart';
import 'package:to_do_app/core/network/dio_factory.dart';
import 'package:to_do_app/core/network/endpoints.dart';
import 'package:to_do_app/features/auth/regester_screen/data/model/register_request_body.dart';

class RegisterRepo {
  static Future<String?> register(RegisterRequestBody body) async {
    try {
      var response = await DioFactory.dio.post(
        Endpoints.register,
        data: body.toJson(),
      );
      if (response.statusCode == 200) {
        final String token = response.data['data']['token'];
        final String name = response.data['data']['user']['name'];
        await AppPreferences.saveToken(token: token);
        await AppPreferences.saveUserName(name: body.name);
        return token;
      } else {
        return null;
      }
    } catch (e) {
      if (e is DioException) {
        print("server false:${e.response?.data}");
      }
      return null;
    }
  }
}
