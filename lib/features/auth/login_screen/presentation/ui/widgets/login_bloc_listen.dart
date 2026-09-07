import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helper/app_dialog.dart';
import 'package:to_do_app/core/helper/app_preferences.dart';
import 'package:to_do_app/core/helper/extentions.dart';
import 'package:to_do_app/core/routes/routes.dart';
import 'package:to_do_app/features/auth/login_screen/presentation/cubit/login_cubit.dart';

class LoginBlocListen extends StatelessWidget {
  const LoginBlocListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          AppDialog.loadingdialog(context);
        } else if (state is LoginSuccess) {
          await AppPreferences.saveToken(token: state.token);
          context.pushNamedAndRemoveUntil(Routes.homescreen, false);
        } else if (state is LoginError) {
          context.pop();
          AppDialog.error(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
