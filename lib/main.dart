import 'package:flutter/material.dart';
import 'package:workshop_task/screens/register_screen.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}
