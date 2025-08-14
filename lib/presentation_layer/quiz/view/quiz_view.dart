import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/constatnts.dart';
import 'package:online_exam/presentation_layer/quiz/manager/quiz_cubit.dart';
import 'package:online_exam/presentation_layer/quiz/view/quiz_view_body.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_quiz_app_bar.dart';

import '../../../di.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => getIt<QuizCubit>()..getQuestionsOnExam(examId: id),
      child: Scaffold(
        appBar: const CustomQuizAppBar(),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 8.0.h, horizontal: Constants.appSecoundPadding),
          child: const QuizViewBody(),
        )),
      ),
    );
  }
}
