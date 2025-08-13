import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:online_exam/main.dart';
import 'package:online_exam/presentation_layer/main_layouts/main_layout.dart';

import '../../presentation_layer/exams/view/exams_view.dart';

abstract class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.exams:
        return MaterialPageRoute(
            builder: (_) => const ExamsView(), settings: settings);
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
