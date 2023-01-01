import 'package:flutter/material.dart';
import 'package:shopping_app/screens/AuthenticationScreen.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shopping app',
      home: AuthenticationScreen(),
    );
  }
}
