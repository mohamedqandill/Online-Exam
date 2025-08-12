import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:online_exam/main.dart';
import 'package:online_exam/presentation_layer/main_layouts/main_layout.dart';

abstract class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
