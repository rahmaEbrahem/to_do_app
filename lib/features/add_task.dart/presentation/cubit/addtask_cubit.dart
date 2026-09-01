import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/add_task.dart/data/model/addtask_request_body.dart';
import 'package:to_do_app/features/add_task.dart/data/repo/add_task_repo.dart';

part 'addtask_state.dart';

class AddtaskCubit extends Cubit<AddtaskState> {
  AddtaskCubit() : super(AddtaskInitial());
  Future<void> addTask(AddTaskRequestBody body) async {
    emit(Addtaskloading());

    try {
      final result = await AddTaskRepo.addTask(body);

      if (result) {
        emit(Addtasksuccess());
      } else {
        emit(Addtaskerror());
      }
    } catch (e) {
      emit(Addtaskerror());
    }
  }
}
