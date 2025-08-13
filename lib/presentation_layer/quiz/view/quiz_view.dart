import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/constatnts.dart';
import 'package:online_exam/presentation_layer/quiz/view/quiz_view_body.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_quiz_app_bar.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomQuizAppBar(),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: Constants.appSecoundPadding),
            child: const QuizViewBody(),
          )
      ),
    );
  }
}
