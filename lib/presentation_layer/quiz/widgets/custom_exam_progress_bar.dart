import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class CustomExamProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const CustomExamProgressBar({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = currentQuestion / totalQuestions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Question $currentQuestion of $totalQuestions",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 3),
        LinearProgressIndicator(
          value: progressValue,
          minHeight: 6,
          backgroundColor: Colors.grey[300],
          color: AppColors.blueShades[60],
          borderRadius: BorderRadius.circular(10.r),
        ),
      ],
    );
  }
}
