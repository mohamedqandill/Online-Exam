import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:online_exam/main.dart';
import 'package:online_exam/presentation_layer/main_layouts/main_layout.dart';
import 'package:online_exam/presentation_layer/score/views/score_view.dart';

import '../../presentation_layer/exams/view/exams_view.dart';
import '../../presentation_layer/quiz/view/quiz_view.dart';

abstract class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.exams:
        return MaterialPageRoute(
            builder: (_) => const ExamsView(), settings: settings);

      case Routes.quiz:
        return MaterialPageRoute(
            builder: (_) => const QuizView(), settings: settings);
      case Routes.score:
        return MaterialPageRoute(
            builder: (_) => const ScoreView(), settings: settings);

      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
