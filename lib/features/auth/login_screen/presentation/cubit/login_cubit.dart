import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/features/auth/login_screen/data/models/login_request_body.dart';
import 'package:to_do_app/features/auth/login_screen/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  void LoginState(LoginRequestBody body) async {
    emit(LoginLoading());
    try {
      final result = await LoginRepo.login(body);
      if (result != null) {
        emit(LoginSuccess(token: result.token, name: result.name));
      } else {
        emit(LoginError(message: 'login failed'));
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
