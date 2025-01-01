import 'package:expensetrackerapp/core/routing/routes.dart';
import 'package:expensetrackerapp/features/signup/logic/cubit/singup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupListenerWidget extends StatelessWidget {
  const SignupListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Signupseccessstate ||
          current is SignupErrorState ||
          current is SignupLoadingState,
      listener: (context, state) {
        if (state is SignupLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SignupErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('error signup in !'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          Navigator.pop(context);
          Navigator.pushNamed(context, Routes.home);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
