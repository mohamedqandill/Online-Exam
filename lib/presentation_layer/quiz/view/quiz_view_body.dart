import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/widgets/custom_loading.dart';
import 'package:online_exam/presentation_layer/quiz/manager/quiz_cubit.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_exam_progress_bar.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_questions_page_view.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_quiz_buttons.dart';

class QuizViewBody extends StatefulWidget {
  const QuizViewBody({super.key});

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<QuizCubit>(context);
        return state is GetQuizSuccess
            ? CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        CustomExamProgressBar(
                          currentQuestion: cubit.currentQuestion + 1,
                          totalQuestions: cubit.pages.length,
                        ),

                        SizedBox(height: 40.h),

                        CustomQuestionsPageView(
                          controller: cubit.pageController,
                          onPageChanged: (index) {
                            cubit.currentQuestion = index;
                            setState(() {});
                          },
                          pages: cubit.pages,
                        ),

                        const SizedBox(height: 60),

                        // Navigation buttons
                        CustomQuizButtons(
                          isLastQuestion:
                              cubit.currentQuestion == cubit.pages.length - 1,
                          onBack: () {
                            if (cubit.currentQuestion > 0) {
                              cubit.pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          onNext: () async {
                            if (cubit.currentQuestion <
                                cubit.pages.length - 1) {
                              cubit.addToCheckedQuestions();
                              await cubit.saveQuestionAnswers();
                              cubit.pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : customLoading(context);
      },
    );
  }
}
