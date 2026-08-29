import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveToken({required String token}) async {
    return await sharedPreferences.setString('user_token', token);
  }

  static String? getToken() {
    return sharedPreferences.getString('user_token');
  }

  static Future<bool> saveUserName({required String name}) async {
    return await sharedPreferences.setString('user_name', name);
  }

  static String? getUserName() {
    return sharedPreferences.getString('user_name');
  }
}
