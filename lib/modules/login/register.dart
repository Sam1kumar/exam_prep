import 'package:exam_prep/const/app_colors.dart';
import 'package:exam_prep/modules/common/widgets/button.dart';
import 'package:exam_prep/modules/common/widgets/text_input.dart';
import 'package:flutter/material.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({Key? key}) : super(key: key);

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Form(
            key: _registerFormKey,
            child: Column(
              children: [
                TextInput(
                  isRequired: true,
                  helpText: 'Please enter user name',
                ),
                TextInput(
                  isRequired: true,
                  inputType: TextInputType.emailAddress,
                  helpText: 'Please enter email',
                ),
                TextInput(
                  isRequired: true,
                  inputType: TextInputType.number,
                  helpText: 'Please enter contact number',
                ),
                TextInput(
                  isRequired: true,
                  helpText: 'Please enter password',
                ),
                
              ],
            ),
          ),
          Spacer(),
            Button(onTap: () {}, title: "Sign Up"),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Already have an account, Sign up',
                style: const TextStyle(color: CommonColor.baseColor2,),
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
