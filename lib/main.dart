import 'package:flutter/material.dart';
import 'pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sign Up',
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
