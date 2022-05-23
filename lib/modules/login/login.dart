import 'package:exam_prep/app/app.dart';
import 'package:exam_prep/const/app_colors.dart';
import 'package:exam_prep/modules/common/widgets/button.dart';
import 'package:exam_prep/modules/common/widgets/text_input.dart';
import 'package:exam_prep/routing/routing.gr.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterPage extends StatefulWidget {
  const LoginAndRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginAndRegisterPage> createState() => _LoginAndRegisterPageState();
}

class _LoginAndRegisterPageState extends State<LoginAndRegisterPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Form(
            key: _loginFormKey,
            child: Column(
              children: [
                TextInput(
                  isRequired: true,
                  helpText: 'Please enter user name',
                ),
                TextInput(
                  isRequired: true,
                  helpText: 'Please enter password',
                ),
              ],
            ),
          ),
          Spacer(),
          Button(onTap: () {}, title: "Login"),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async{
              await appRouter.push(const RegisterationPageRoute());
            },
            child: Text(
              'Already have an account, Sign in',
              style: const TextStyle(
                color: CommonColor.baseColor2,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
