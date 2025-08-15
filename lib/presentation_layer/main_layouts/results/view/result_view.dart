import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../exams/widgets/custom_exam_container.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: CustomScrollView(
          slivers: [
            SliverList.separated(
              itemCount: 2,
              itemBuilder: (context, index) {
                return const InkWell(
                  // onTap: () => Navigator.pushNamed(
                  //     context, Routes.quiz,
                  //     arguments: ""),
                  child: CustomExamContainer(
                    quizTitle: "mmmm",
                    durationNumber: "sdas",
                    questionNumber: "sad",
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
    );
  }
}
