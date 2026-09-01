import 'package:dio/dio.dart';
import 'package:to_do_app/core/network/Error_handling.dart';
import 'package:to_do_app/core/network/dio_factory.dart';
import 'package:to_do_app/core/network/endpoints.dart';
import 'package:to_do_app/features/home_screen/data/model/home_model.dart';

class GetTasksRepo {
  static Future<Homemodel?> getTasks() async {
    try {
      final response = await DioFactory.dio.get(Endpoints.tasks);

      if (response.statusCode == 200) {
        return Homemodel.fromJson(response.data);
      }

      return null;
    } on DioException catch (e) {
      final apiexeption = ApiExeption(
        statuscode: e.response?.statusCode ?? 0,
        message: e.response?.data?['message'] ?? e.message ?? "unKnown error",
      );
      print(ErrorHandling.handle(apiexeption));
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
