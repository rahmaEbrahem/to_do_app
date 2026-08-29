import 'package:dio/dio.dart';
import 'package:to_do_app/core/network/dio_factory.dart';
import 'package:to_do_app/core/network/endpoints.dart';
import 'package:to_do_app/features/update_task/data/model/update_task_request_body.dart';

class UpdateTaskRepo {
  static Future<bool> updateTask(int taskId, UpdateTaskRequestBody body) async {
    try {
      final response = await DioFactory.dio.put(
        "${Endpoints.tasks}/$taskId",
        data: body.toJson(),
      );

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } on DioException catch (e) {
      print("Server Error: ${e.response?.data}");
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
