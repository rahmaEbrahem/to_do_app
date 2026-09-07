import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helper/app_dialog.dart';
import 'package:to_do_app/core/helper/extentions.dart';
import 'package:to_do_app/core/routes/routes.dart';
import 'package:to_do_app/features/auth/regester_screen/presentation/cubit/register_cubit.dart';

class RegistBlocListen extends StatelessWidget {
  const RegistBlocListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state is RegisterLoading) {
          AppDialog.loadingdialog(context);
        } else if (state is RegisterSuccess) {
          context.pushNamedAndRemoveUntil(Routes.loginscreen, false);
        } else if (state is RegisterError) {
          context.pop();
          AppDialog.error(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
