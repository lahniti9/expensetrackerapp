import 'package:expensetrackerapp/core/routing/routes.dart';
import 'package:expensetrackerapp/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buildbloclestener extends StatelessWidget {
  const Buildbloclestener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loginseccessstate ||
          current is LoginErrorState ||
          current is LoginLoadingState,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoginErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('error loggin in !'),
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
