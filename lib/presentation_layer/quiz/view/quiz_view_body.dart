import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/constatnts.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_exam_progress_bar.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_questions_page_view.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_quiz_buttons.dart';
import '../widgets/custom_option_question.dart';

class QuizViewBody extends StatefulWidget {
  const QuizViewBody({super.key});

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  final PageController pageController = PageController();
  int currentQuestion = 0;

  // ToDo:  just for testing (hi mohamed) 😄
  late final List<Widget> pages = [
    CustomOptionsQuestion(
      options: const [
        "Its going to rain today.",
        "Its going to rain today.",
        "Its going to rain today.",
        "Its going to rain today."
      ],
      onChanged: (selectedIndexes) {
        print("selected asnwsers: $selectedIndexes");
      },
    ),
    CustomOptionsQuestion(
      options: const [
        "Its going to rain today.",
        "Its going to rain today.",
        "Its going to rain today.",
        "Its going to rain today."
      ],
      onChanged: (selectedIndexes) {
        print("selected asnwsers: $selectedIndexes");
      },
    ),
    CustomOptionsQuestion(
      options: const [
        "Its going to rain today.",
        "Its going to rain today.",
        "Its going to rain today.",
        "Its going to rain today."
      ],
      onChanged: (selectedIndexes) {
        print("selected asnwsers: $selectedIndexes");
      },
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              CustomExamProgressBar(
                currentQuestion: currentQuestion + 1,
                totalQuestions: pages.length,
              ),

              const SizedBox(height: 28),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.quizTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20.sp),
                ),
              ),

              const SizedBox(height: 14),

              CustomQuestionsPageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentQuestion = index;
                  });
                },
                pages: pages,
              ),

              const SizedBox(height: 60),

              // Navigation buttons
              CustomQuizButtons(
                onBack: () {
                  if (currentQuestion > 0) {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                onNext: () {
                  if (currentQuestion < pages.length - 1) {
                    pageController.nextPage(
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
    );
  }
}
