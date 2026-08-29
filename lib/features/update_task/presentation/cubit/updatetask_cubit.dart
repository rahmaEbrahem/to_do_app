import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/update_task/data/model/update_task_request_body.dart';

import '../../data/repo/update_repo.dart';

part 'updatetask_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit() : super(UpdateTaskInitial());

  Future<void> updateTask(int taskId, UpdateTaskRequestBody body) async {
    emit(UpdateTaskLoading());

    try {
      final result = await UpdateTaskRepo.updateTask(taskId, body);

      if (result) {
        emit(UpdateTaskSuccess());
      } else {
        emit(UpdateTaskError());
      }
    } catch (e) {
      emit(UpdateTaskError());
    }
  }
}
