import 'package:bloc/bloc.dart';
import 'package:expensetrackerapp/core/networking/firbase_helper.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirbaseHelper firebaseHelper;
  LoginCubit(this.firebaseHelper) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    emit(LoginLoadingState());
    try {
      await firebaseHelper
          .loginUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      )
          .then((value) {
        emit(Loginseccessstate());
      }).catchError((error) {
        emit(LoginErrorState());
      });
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}