// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../app/splash.dart' as _i1;
import '../modules/instructor/create_question/create_question.dart' as _i2;
import '../modules/instructor/home.dart' as _i4;
import '../modules/login/login.dart' as _i3;
import '../modules/login/register.dart' as _i6;
import '../modules/student/home.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    CreateQuestionPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CreateQuestionPage());
    },
    LoginAndRegisterPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginAndRegisterPage());
    },
    InstructorHomePageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.InstructorHomePage());
    },
    StudentHomePageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.StudentHomePage());
    },
    RegisterationPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.RegisterationPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(SplashPageRoute.name, path: '/'),
        _i7.RouteConfig(CreateQuestionPageRoute.name,
            path: '/create-question-page'),
        _i7.RouteConfig(LoginAndRegisterPageRoute.name,
            path: '/login-and-register-page'),
        _i7.RouteConfig(InstructorHomePageRoute.name,
            path: '/instructor-home-page'),
        _i7.RouteConfig(StudentHomePageRoute.name, path: '/student-home-page'),
        _i7.RouteConfig(RegisterationPageRoute.name,
            path: '/registeration-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i7.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.CreateQuestionPage]
class CreateQuestionPageRoute extends _i7.PageRouteInfo<void> {
  const CreateQuestionPageRoute()
      : super(CreateQuestionPageRoute.name, path: '/create-question-page');

  static const String name = 'CreateQuestionPageRoute';
}

/// generated route for
/// [_i3.LoginAndRegisterPage]
class LoginAndRegisterPageRoute extends _i7.PageRouteInfo<void> {
  const LoginAndRegisterPageRoute()
      : super(LoginAndRegisterPageRoute.name, path: '/login-and-register-page');

  static const String name = 'LoginAndRegisterPageRoute';
}

/// generated route for
/// [_i4.InstructorHomePage]
class InstructorHomePageRoute extends _i7.PageRouteInfo<void> {
  const InstructorHomePageRoute()
      : super(InstructorHomePageRoute.name, path: '/instructor-home-page');

  static const String name = 'InstructorHomePageRoute';
}

/// generated route for
/// [_i5.StudentHomePage]
class StudentHomePageRoute extends _i7.PageRouteInfo<void> {
  const StudentHomePageRoute()
      : super(StudentHomePageRoute.name, path: '/student-home-page');

  static const String name = 'StudentHomePageRoute';
}

/// generated route for
/// [_i6.RegisterationPage]
class RegisterationPageRoute extends _i7.PageRouteInfo<void> {
  const RegisterationPageRoute()
      : super(RegisterationPageRoute.name, path: '/registeration-page');

  static const String name = 'RegisterationPageRoute';
}
