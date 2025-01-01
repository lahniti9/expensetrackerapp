import 'package:expensetrackerapp/core/helpers/spacing.dart';
import 'package:expensetrackerapp/core/routing/routes.dart';
import 'package:expensetrackerapp/core/theming/fonts.dart';
import 'package:expensetrackerapp/core/theming/my_colors.dart';
import 'package:expensetrackerapp/core/widjets/my_text_form_fild.dart';
import 'package:expensetrackerapp/core/widjets/my_button.dart';
import 'package:expensetrackerapp/features/login/logic/cubit/login_cubit.dart';
import 'package:expensetrackerapp/features/login/ui/widjets/build_bloc_lestener.dart';
import 'package:expensetrackerapp/features/signup/logic/cubit/singup_cubit.dart';
import 'package:expensetrackerapp/features/signup/ui/widgets/signup_listener_widjet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isobscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullnameController;
  late TextEditingController confirmpasswordController;

  @override
  void initState() {
    super.initState();
    emailController = context.read<SignupCubit>().emailController;
    passwordController = context.read<SignupCubit>().passwordController;
    fullnameController = context.read<SignupCubit>().fullnameController;
    confirmpasswordController =
        context.read<SignupCubit>().confirmpasswordController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.blackColor,
        appBar: AppBar(
          backgroundColor: MyColors.blackColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(50),
                      Text(
                        'Welcom To Expense Tracker',
                        style: FontsHelper.font28boldwhite,
                      ),
                      verticalSpace(50),
                      Form(
                          key: context.read<SignupCubit>().formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full Name',
                                  style: FontsHelper.font18boldwhite,
                                ),
                                verticalSpace(10),
                                MyTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  controller: fullnameController,
                                  hintText: 'Enter your name',
                                  prefixIcon: const Icon(Icons.person),
                                  isobscureText: false,
                                ),
                                verticalSpace(20),
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
                                verticalSpace(20),
                                Text(
                                  'Confirm Password',
                                  style: FontsHelper.font18boldwhite,
                                ),
                                verticalSpace(10),
                                MyTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the same password';
                                    } else if (passwordController.text.trim() !=
                                        confirmpasswordController.text.trim()) {
                                      return 'passwords do not match';
                                    }
                                    return null;
                                  },
                                  isobscureText: isobscureText,
                                  controller: confirmpasswordController,
                                  hintText: 'confirm your password',
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
                      verticalSpace(27),
                      Center(
                        child: Text(
                            'by continuing, you agree to our terms and conditions',
                            textAlign: TextAlign.center,
                            style: FontsHelper.font13bold),
                      ),
                      verticalSpace(21),
                      Center(
                        child: MyButton(
                          width: 200,
                          gradient: MyColors.gradient,
                          onPressed: () {
                            validateThensignup();
                          },
                          child: Text(
                            'Signup',
                            style: FontsHelper.font16bold,
                          ),
                        ),
                      ),
                      verticalSpace(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'you have an account?',
                            style: FontsHelper.font13bold,
                          ),
                          horizontalSpace(2),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.login);
                            },
                            child: Text(
                              'Login',
                              style: FontsHelper.fontsignup,
                            ),
                          ),
                        ],
                      ),
                      const SignupListenerWidget()
                    ],
                  ),
                ))));
  }

  validateThensignup() {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().signup();
    }
  }
}
