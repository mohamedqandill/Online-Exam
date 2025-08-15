import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/storage/hive.dart';
import 'package:online_exam/domain_layer/models/saved_qusetions_answers.dart';

import '../../../exams/widgets/custom_exam_container.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  List<SavedExams> savedExams = [];

  @override
  void initState() {
    getExams();
    super.initState();
  }

  getExams() async {
    savedExams = await ExamsHiveHelper.getAllExams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList.separated(
                itemCount: savedExams.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    // onTap: () => Navigator.pushNamed(
                    //     context, Routes.quiz,
                    //     arguments: ""),
                    child: CustomExamContainer(
                      quizTitle: savedExams[index].examTitle,
                      durationNumber: savedExams[index].examDuration.toString(),
                      questionNumber:
                          savedExams[index].numberOfQuestions.toString(),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              )
            ],
          ),
        ),
      ],
    ));
  }
}
