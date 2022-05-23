import 'package:exam_prep/app/app.dart';
import 'package:exam_prep/initializers/initializers.dart';
import 'package:exam_prep/repository/user_repository/user_repository.dart';
import 'package:exam_prep/routing/routing.gr.dart';
import 'package:flutter/material.dart';

class InstructorHomePage extends StatefulWidget {
  const InstructorHomePage({Key? key}) : super(key: key);

  @override
  State<InstructorHomePage> createState() => _InstructorHomePageState();
}

class _InstructorHomePageState extends State<InstructorHomePage> {
  final _userRepository = locator<UserRepository>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_userRepository.userName}'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              appRouter.push(const CreateQuestionPageRoute());
            },
            child: Center(
              child: Text('Create Question'.toUpperCase()),
            ),
          ),
          InkWell(
            child: Center(
              child: Text('View Question'.toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
