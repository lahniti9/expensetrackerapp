import 'package:expensetrackerapp/core/routing/routing.dart';
import 'package:expensetrackerapp/firebase_options.dart';
import 'package:expensetrackerapp/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    routing: Routing(),
  ));
}
