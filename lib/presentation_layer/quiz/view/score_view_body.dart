import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_one/core/utils/app_colors.dart';
import 'package:online_exam_one/core/utils/constatnts.dart';
import 'package:online_exam_one/presentation_layer/quiz/widgets/custom_score_widget.dart';

import '../../../core/routes/routes.dart';

class ScoreViewBody extends StatelessWidget {
  const ScoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Constants.yourScore,
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        const SizedBox(height: 24),

        Row(
          children: [
            CustomScoreCircleProgress(
              correct: 18,
              incorrect: 2,
              size: 132.sp,
              strokeWidth: 8.w,
            ),

            const SizedBox(width: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '18',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.blueShades[60]),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Text(
                      Constants.correct,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueShades[60],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.red,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '2',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.red)
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Text(
                      Constants.inCorrect,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 80),


        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueShades[60],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.score);
            },
            child: Text(
              Constants.showResults,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.white),
            ),
          ),
        ),

        SizedBox(height: 24.h),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: AppColors.blueShades[60]!,
                width: 2.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.quiz);
            },
            child: Text(
              Constants.startAgain,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.blueShades[60],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )

      ],
    );
  }
}
