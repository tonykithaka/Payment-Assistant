import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:payment_assistant/screens/SignUpSuccess.dart';
import 'package:payment_assistant/screens/dashboard.dart';
import 'package:payment_assistant/screens/login.dart';

Future main() async {
  // await DotEnv().load('.env');
  runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
    '/': (context) => Login(),
    '/signUpSuccess': (context) => SignUpSuccess(),
    '/dashboard': (context) => Dashboard(),
  }));
}
