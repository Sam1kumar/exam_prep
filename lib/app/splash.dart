import 'package:exam_prep/app/app.dart';
import 'package:exam_prep/const/app_colors.dart';
import 'package:exam_prep/initializers/initializers.dart';
import 'package:exam_prep/repository/user_repository/model/user_type.dart';
import 'package:exam_prep/repository/user_repository/user_repository.dart';
import 'package:exam_prep/routing/routing.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                'assets/images/undraw_education_f8ru.svg',
                width: width * 0.7,
              ),
            ),
            SizedBox(
                width: width * 0.8,
                child: const LinearProgressIndicator(
                  color: CommonColor.baseColor2,
                  backgroundColor: CommonColor.baseColor,
                )),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Please wait, while we start your app ...'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (locator<UserRepository>().isUserLoggedIn) {
      switch (locator<UserRepository>().userType) {
        case UserType.instructor:
          await appRouter.pushAndPopUntil(const InstructorHomePageRoute(),
              predicate: (_) => false);
          break;
        default:
          await appRouter.pushAndPopUntil(const InstructorHomePageRoute(),
              predicate: (_) => false);
      }
    } else {
      await appRouter.pushAndPopUntil(const LoginAndRegisterPageRoute(),
          predicate: (_) => false);
    }
  }
}
