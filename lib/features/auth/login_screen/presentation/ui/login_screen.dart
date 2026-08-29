import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:to_do_app/core/theme/app_text_styles.dart';

import 'package:to_do_app/core/widgets/custom_container.dart';
import 'package:to_do_app/core/widgets/custom_text_field.dart';
import 'package:to_do_app/features/auth/login_screen/data/models/login_request_body.dart';
import 'package:to_do_app/features/auth/login_screen/presentation/cubit/login_cubit.dart';
import 'package:to_do_app/features/auth/login_screen/presentation/ui/widgets/login_bloc_listen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  var emailcontrollar = TextEditingController();
  var passwordcontrollar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginBlocListen(),
                200.verticalSpace,
                Text("Login", style: AppTextStyles.titles),
                50.verticalSpace,
                CustomTextField(
                  subtitle: "Email",
                  descripe: " please enter your Email",
                  controller: emailcontrollar,
                  keyboardtype: TextInputType.emailAddress,
                ),
                15.verticalSpace,
                CustomTextField(
                  subtitle: "Password",
                  descripe: "Please enter your password",
                  controller: passwordcontrollar,
                  keyboardtype: TextInputType.visiblePassword,
                ),
                50.verticalSpace,
                CustomContainer(
                  title: "Login",
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      context.read<LoginCubit>().LoginState(
                        LoginRequestBody(
                          email: emailcontrollar.text,
                          password: passwordcontrollar.text,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
