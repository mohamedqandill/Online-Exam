import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:online_exam/main.dart';

abstract class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.explore:
        return MaterialPageRoute(builder: (_) => const MyApp());
      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }
}
