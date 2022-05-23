import 'dart:async';

import 'package:exam_prep/app/app.dart';
import 'package:exam_prep/app/app_error_page.dart';
import 'package:exam_prep/app/flavor.dart';
import 'package:exam_prep/initializers/initializers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> mainCommon({required Environment env}) async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    /// Forcing only portrait orientation
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final _flavor = env.flavor;

    await AppInjector().configure(_flavor);

    await runZonedGuarded<Future<void>>(() async {
      runApp(
        MyApp(env),
      );
    }, (e, s) {
      print(
          'Something went wrong while initializing please report it to owner');
    });
  } catch (e, s) {
    runApp(AppErrorPage(error: e.toString()));
    return;
  }
}
