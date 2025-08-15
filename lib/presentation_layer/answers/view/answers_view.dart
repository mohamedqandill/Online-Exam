import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/constatnts.dart';
import 'package:online_exam/core/widgets/custom_loading.dart';
import 'package:online_exam/core/widgets/main_appBar.dart';
import 'package:online_exam/presentation_layer/quiz/manager/quiz_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../di.dart';
import '../widgets/custom_Questions_list_view.dart';

class AnswersView extends StatelessWidget {
  const AnswersView({super.key});

  @override
  Widget build(BuildContext context) {
    var examId = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) => getIt<QuizCubit>()
        ..getQuestionsOnExam(examId: examId)
        ..getSavedExam(examId),
      child: Scaffold(
        appBar: MainAppBar(
          title: Text(
            Constants.answers,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 22.sp),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30.sp,
              )),
        ),
        body: BlocConsumer<QuizCubit, QuizState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<QuizCubit>(context);
            return state is GetQuizSuccess
                ? Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverList.separated(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(Constants.appPadding),
                                  child: Container(
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                            width: 1, color: AppColors.white),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.blackShades[10]!,
                                              blurRadius: 4,
                                              spreadRadius: 0)
                                        ]),
                                    child: CustomQuestionListView(
                                      correctAnswer: cubit.savedExam!
                                          .savedAnswers[index].correctAnswer,
                                      userAnswer: cubit.savedExam!
                                          .savedAnswers[index].userAnswer,
                                      questions: cubit
                                              .questions
                                              .questions?[index]
                                              .questionTitle ??
                                          "",
                                      options: cubit
                                          .questions.questions![index].answers!
                                          .map(
                                            (e) => e.answer!,
                                          )
                                          .toList(),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                              itemCount: cubit.savedExam!.savedAnswers.length,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : customLoading(context);
          },
        ),
      ),
    );
  }
}
