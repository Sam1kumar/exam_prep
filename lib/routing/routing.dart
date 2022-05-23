import 'package:auto_route/auto_route.dart';
import 'package:exam_prep/app/splash.dart';
import 'package:exam_prep/modules/instructor/create_question/create_question.dart';
import 'package:exam_prep/modules/instructor/home.dart';
import 'package:exam_prep/modules/login/login.dart';
import 'package:exam_prep/modules/login/register.dart';
import 'package:exam_prep/modules/student/home.dart';

@MaterialAutoRouter(
  // generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: CreateQuestionPage),
    MaterialRoute(page: LoginAndRegisterPage),
    MaterialRoute(page: InstructorHomePage),
    MaterialRoute(page: StudentHomePage),
    MaterialRoute(page: RegisterationPage),
  ],
)
class $AppRouter {}
