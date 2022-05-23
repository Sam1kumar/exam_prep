import 'package:flutter/material.dart';

class Environment {
  final Flavor flavor;
  final String appTitle;
  final String appStoreUrl;
  final String playStoreUrl;

  const Environment._({
    required this.flavor,
    required this.appTitle,
    required this.appStoreUrl,
    required this.playStoreUrl,
  });

  factory Environment.prod() {
    return const Environment._(
      flavor: Flavor.prod,
      appTitle: 'Exam Prep',
      appStoreUrl: '',
      playStoreUrl: '',
    );
  }

  factory Environment.dev() {
    return const Environment._(
      flavor: Flavor.debug,
      appTitle: 'Exam Prep Debug',
      appStoreUrl: '',
      playStoreUrl: '',
    );
  }
}

enum Flavor { prod, debug }

extension FlavorX on Flavor {
  String get name {
    switch (this) {
      case Flavor.prod:
        return 'Prod';
      case Flavor.debug:
        return 'Dev';
    }
  }

  Color get color {
    switch (this) {
      case Flavor.prod:
        return Colors.blue;
      case Flavor.debug:
        return Colors.red;
    }
  }
}
