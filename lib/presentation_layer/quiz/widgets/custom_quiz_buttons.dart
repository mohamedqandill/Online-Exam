import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/constatnts.dart';

class CustomQuizButtons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;
  final bool isLastQuestion;

  const CustomQuizButtons({
    super.key,
    required this.onBack,
    required this.isLastQuestion,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueShades[60],
          padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onNext,
        child: Text(
          isLastQuestion ? Constants.finish : Constants.next,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
