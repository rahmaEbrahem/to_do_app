import 'package:dio/dio.dart';
import 'package:to_do_app/core/network/Error_handling.dart';
import 'package:to_do_app/core/network/dio_factory.dart';
import 'package:to_do_app/core/network/endpoints.dart';
import 'package:to_do_app/features/add_task.dart/data/model/addtask_request_body.dart';

class AddTaskRepo {
  static Future<bool> addTask(AddTaskRequestBody body) async {
    try {
      final response = await DioFactory.dio.post(
        Endpoints.tasks,
        data: body.toJson(),
      );

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioException catch (e) {
      final apiexeption = ApiExeption(
        statuscode: e.response?.statusCode ?? 0,
        message: e.response?.data?['message'] ?? e.message ?? "unKnown error",
      );
      print(ErrorHandling.handle(apiexeption));
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
