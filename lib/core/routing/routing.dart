import 'package:expensetrackerapp/core/networking/firbase_helper.dart';
import 'package:expensetrackerapp/core/routing/routes.dart';
import 'package:expensetrackerapp/features/home/home_screen.dart';
import 'package:expensetrackerapp/features/login/logic/cubit/login_cubit.dart';
import 'package:expensetrackerapp/features/login/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routing {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(FirbaseHelper()),
            child: const LoginScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(FirbaseHelper()),
            child: const HomeScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Route Found'),
      ),
    );
  }
}
