// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:expensetrackerapp/core/networking/firbase_helper.dart';
import 'package:flutter/material.dart';

part 'singup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.firebaseHelper) : super(SingupInitial());
  final FirbaseHelper firebaseHelper;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signup() async {
    emit(SignupLoadingState());
    try {
      await firebaseHelper
          .registerUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      )
          .then((value) {
        emit(Signupseccessstate());
      }).catchError((error) {
        emit(SignupErrorState());
      });
    } catch (e) {
      emit(SignupErrorState());
    }
  }
}
