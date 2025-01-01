part of 'singup_cubit.dart';

abstract class SignupState {}

final class SingupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class Signupseccessstate extends SignupState {}

final class SignupErrorState extends SignupState {}
