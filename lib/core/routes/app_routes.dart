import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:online_exam/main.dart';
import 'package:online_exam/presentation_layer/main_layouts/main_layout.dart';
import 'package:online_exam/presentation_layer/quiz/view/quiz_view.dart';

abstract class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.quiz:
        return MaterialPageRoute(builder: (_) => const QuizView());

      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
