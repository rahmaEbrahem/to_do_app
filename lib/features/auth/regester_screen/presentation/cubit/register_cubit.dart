import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/auth/regester_screen/data/model/register_request_body.dart';
import 'package:to_do_app/features/auth/regester_screen/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  void registerState(RegisterRequestBody body) async {
    emit(RegisterLoading());
    try {
      final result = await RegisterRepo.register(body);
      if (result != null) {
        emit(RegisterSuccess(token: result, name: body.name));
      } else {
        emit(RegisterError(message: "Register failed"));
      }
    } catch (e) {
      emit(RegisterError(message: e.toString()));
    }
  }
}
