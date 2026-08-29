import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/home_screen/data/model/home_model.dart';
import 'package:to_do_app/features/home_screen/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Future<void> getTasks() async {
    emit(HomeLoading());

    try {
      final response = await GetTasksRepo.getTasks();

      if (response != null) {
        emit(HomeSuccess(homeModel: response));
      } else {
        emit(HomeError());
      }
    } catch (e) {
      emit(HomeError());
    }
  }
}
