import 'package:exam_prep/app/flavor.dart';
import 'package:exam_prep/routing/routing.gr.dart';
import 'package:flutter/material.dart';

final appRouter = AppRouter();

class MyApp extends StatefulWidget {
  const MyApp(this.env, {Key? key}) : super(key: key);

  final Environment env;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: widget.env.appTitle,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
