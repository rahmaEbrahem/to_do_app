import 'package:dio/dio.dart';
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
      print("Server Error: ${e.response?.data}");
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
