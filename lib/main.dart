import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  runApp(const MySociety());
}

class MySociety extends StatelessWidget {
  const MySociety({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Society App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LoginPage(),
    );
  }
}
