import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/helper/extentions.dart';
import 'package:to_do_app/core/routes/routes.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/widgets/custom_container.dart';
import 'package:to_do_app/core/widgets/custom_text_field.dart';
import 'package:to_do_app/features/auth/regester_screen/data/model/register_request_body.dart';
import 'package:to_do_app/features/auth/regester_screen/presentation/cubit/register_cubit.dart';
import 'package:to_do_app/features/auth/regester_screen/presentation/ui/widget/regist_bloc_listen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formkey = GlobalKey<FormState>();
  var namecontrollar = TextEditingController();
  var emailcontrollar = TextEditingController();
  var passwordcontrollar = TextEditingController();
  var passwordconfirmcontrollar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RegistBlocListen(),
                  10.verticalSpace,
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade100,
                    radius: 45,
                    child: Icon(Icons.list_alt_outlined, size: 40.h),
                  ),
                  20.verticalSpace,
                  Text("Welcome to TO DO", style: AppTextStyles.titles),
                  10.verticalSpace,
                  Text(
                    "create an account and join us now!",
                    style: AppTextStyles.fieldsubtitles,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    subtitle: "NAME",
                    descripe: "Enter Your name",
                    keyboardtype: TextInputType.name,
                    controller: namecontrollar,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    subtitle: "Email",
                    descripe: "Enter Your Email",
                    keyboardtype: TextInputType.emailAddress,
                    controller: emailcontrollar,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    subtitle: "Password",
                    descripe: "Enter your Password",
                    keyboardtype: TextInputType.visiblePassword,
                    controller: passwordcontrollar,
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    subtitle: "Password confirmation",
                    keyboardtype: TextInputType.visiblePassword,
                    controller: passwordconfirmcontrollar,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please confirm the password";
                      }
                      if (value != passwordcontrollar.text) {
                        return "the password is false";
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  CustomContainer(
                    title: "Sing Up",
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        context.read<RegisterCubit>().registerState(
                          RegisterRequestBody(
                            name: namecontrollar.text,
                            email: emailcontrollar.text,
                            password: passwordcontrollar.text,
                            passwordconfirm: passwordconfirmcontrollar.text,
                          ),
                        );
                      }
                    },
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: AppTextStyles.containtitles,
                      ),
                      InkWell(
                        onTap: () {
                          context.pushNamed(Routes.loginscreen);
                        },
                        child: Text(
                          "Sing in",
                          style: AppTextStyles.containtitles.copyWith(
                            color: AppColors.maincolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
