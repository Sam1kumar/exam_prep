import 'package:flutter/material.dart';

class AppErrorPage extends StatelessWidget {
  const AppErrorPage({required this.error, Key? key}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error)),
    );
  }
}
