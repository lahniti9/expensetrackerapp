import 'package:expensetrackerapp/core/helpers/spacing.dart';
import 'package:expensetrackerapp/core/theming/fonts.dart';
import 'package:expensetrackerapp/core/theming/my_colors.dart';
import 'package:expensetrackerapp/core/widjets/my_text_form_fild.dart';
import 'package:expensetrackerapp/core/widjets/my_button.dart';
import 'package:expensetrackerapp/features/login/logic/cubit/login_cubit.dart';
import 'package:expensetrackerapp/features/login/ui/widjets/build_bloc_lestener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isobscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.blackColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(100),
              Text(
                'Welcom Back!',
                style: FontsHelper.font28boldwhite,
              ),
              verticalSpace(20),
              Form(
                  key: context.read<LoginCubit>().formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: FontsHelper.font18boldwhite,
                        ),
                        verticalSpace(10),
                        MyTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          controller: emailController,
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email),
                          isobscureText: false,
                        ),
                        verticalSpace(20),
                        Text(
                          'Password',
                          style: FontsHelper.font18boldwhite,
                        ),
                        verticalSpace(10),
                        MyTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          isobscureText: isobscureText,
                          controller: passwordController,
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: isobscureText
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isobscureText = !isobscureText;
                              });
                            },
                          ),
                        ),
                      ])),
              verticalSpace(15),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: FontsHelper.fontsignup,
                ),
              ),
              verticalSpace(60),
              Center(
                child: MyButton(
                  width: 200,
                  gradient: MyColors.gradient,
                  onPressed: () {
                    validateThenlogin();
                  },
                  child: Text(
                    'Login',
                    style: FontsHelper.font16bold,
                  ),
                ),
              ),
              verticalSpace(15),
              Center(
                child: Text(
                    'by continuing, you agree to our terms and conditions',
                    textAlign: TextAlign.center,
                    style: FontsHelper.font13bold),
              ),
              verticalSpace(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: FontsHelper.font13bold,
                  ),
                  horizontalSpace(2),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: FontsHelper.fontsignup,
                    ),
                  ),
                ],
              ),
              Buildbloclestener(),
            ],
          ),
        )));
  }

  validateThenlogin() {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
