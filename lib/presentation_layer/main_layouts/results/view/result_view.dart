import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/storage/hive.dart';
import 'package:online_exam/domain_layer/models/saved_qusetions_answers.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_empty_data_widget.dart';
import '../../../../main.dart';
import '../../../exams/widgets/custom_exam_container.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> with RouteAware {
  List<SavedExams> savedExams = [];

  getExams() async {
    var result = await ExamsHiveHelper.getAllExams();
    setState(() {
      savedExams = result;
    });
  }

  @override
  void initState() {
    getExams();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    print("pop");
    getExams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: savedExams.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList.separated(
                          itemCount: savedExams.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.answers,
                                  arguments: savedExams[index].examId),
                              child: CustomExamContainer(
                                quizTitle: savedExams[index].examTitle,
                                durationNumber:
                                    savedExams[index].examDuration.toString(),
                                questionNumber: savedExams[index]
                                    .numberOfQuestions
                                    .toString(),
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
              )
            : const CustomEmptyDataWidget());
  }
}
