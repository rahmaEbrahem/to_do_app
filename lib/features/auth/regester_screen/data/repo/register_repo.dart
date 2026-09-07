import 'package:dio/dio.dart';
import 'package:to_do_app/core/helper/app_preferences.dart';
import 'package:to_do_app/core/network/Error_handling.dart';
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
    } on DioException catch (e) {
      final apiexeption = ApiExeption(
        statuscode: e.response?.statusCode ?? 0,
        message: e.response?.data?['message'] ?? e.message ?? "unKnown error",
      );
      throw Exception(ErrorHandling.handle(apiexeption));
    } catch (e) {
      rethrow;
    }
  }
}
