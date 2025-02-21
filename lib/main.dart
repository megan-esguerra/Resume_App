import 'package:flutter/cupertino.dart';
import 'login.dart'; // Ensure this file exists and contains LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger Clone',
      home: const LoginPage(),
    );
  }
}
