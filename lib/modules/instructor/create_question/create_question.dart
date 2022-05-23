import 'package:flutter/material.dart';

class CreateQuestionPage extends StatefulWidget {
  const CreateQuestionPage({Key? key}) : super(key: key);

  @override
  State<CreateQuestionPage> createState() => _CreateQuestionPageState();
}

class _CreateQuestionPageState extends State<CreateQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Question')),
      body: ListView.builder(itemBuilder: (context, index) {
        return Container();
      }),
    );
  }
}
