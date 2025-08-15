import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/storage/hive.dart';
import 'package:online_exam/domain_layer/models/checked_questions.dart';
import 'package:online_exam/domain_layer/models/questions.dart';
import 'package:online_exam/domain_layer/models/saved_qusetions_answers.dart';
import 'package:online_exam/domain_layer/use_cases/get_questions_on_exam_use_case.dart';

import '../../../core/routes/routes.dart';
import '../widgets/custom_option_question.dart';

part 'quiz_state.dart';

@injectable
class QuizCubit extends Cubit<QuizState> {
  GetQuestionsOnExamUseCase _getQuestionsOnExamUseCase;

  QuizCubit(this._getQuestionsOnExamUseCase) : super(QuizInitial());

  late Questions questions;
  final PageController pageController = PageController();
  int currentQuestion = 0;
  int questionIndex = 0;
  int selectedQuestion = 0;

  List<Widget> pages = [];
  List<CheckedQuestions> checkedQuestions = [];
  bool isAnswerSelect = false;

  Future<void> getQuestionsOnExam({required String examId}) async {
    try {
      var result = await _getQuestionsOnExamUseCase.call(examId: examId);

      result.fold(
        (l) {
          emit(GetQuizError(l.errorsModel.message));
        },
        (r) {
          questions = r;
          buildQuestionPages();
          emit(GetQuizSuccess());
        },
      );
    } catch (e) {
      emit(GetQuizError(e.toString()));
    }
  }

  bool isAnswerSelected() {
    print(isAnswerSelect);
    return isAnswerSelect;
  }

  buildQuestionPages() {
    pages = List.generate(
      questions.questions!.length,
      (index) {
        return CustomOptionsQuestion(
          questions: questions.questions?[index].questionTitle ?? "",
          options: questions.questions![index].answers!
              .map(
                (e) => e.answer!,
              )
              .toList(),
          onChanged: (selectedOption) async {
            isAnswerSelect = true;
            selectedQuestion = selectedOption;
            questionIndex = index;
          },
        );
      },
    );
  }

  addToCheckedQuestions() {
    checkedQuestions.add(CheckedQuestions(
        questionId: questions.questions![questionIndex].id,
        userAnswers: questions
            .questions![questionIndex].answers![selectedQuestion].key));
  }

  Future<void> saveQuestionAnswers() async {
    await ExamsHiveHelper.saveExam(SavedExams(
        examDuration: questions.questions![questionIndex].duration!,
        examTitle: questions.questions![questionIndex].examTitle!,
        numberOfQuestions:
            questions.questions![questionIndex].numberOfQuestions!,
        examId: questions.questions![questionIndex].examId!,
        savedAnswers: checkedQuestions
            .map(
              (e) => SavedAnswers(
                  questionId: e.questionId!,
                  correctAnswer:
                      questions.questions![questionIndex].correctAnswer!,
                  userAnswer: e.userAnswers!),
            )
            .toList()));
  }

  Future<void> navigateToScoreScreen(BuildContext context) async {
    Navigator.pushReplacementNamed(context, Routes.score, arguments: {
      "checkedQuestion": checkedQuestions,
      "examId": questions.questions?[questionIndex].examId
    });
  }

  nextPageView() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
