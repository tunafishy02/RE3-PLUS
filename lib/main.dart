import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signin_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Re3App());
}

class Re3App extends StatelessWidget {
  const Re3App({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Re3Plus',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const SignUpPage(),
    );
  }
}