import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/presentation_layer/score/manager/score_cubit.dart';

import '../../../core/routes/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constatnts.dart';
import '../widgets/custom_score_circle_progress.dart';

class ScoreViewBody extends StatelessWidget {
  const ScoreViewBody({super.key, required this.examId});

  final String examId;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ScoreCubit>(context);
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
              correct: cubit.checkedQuestionsInfo.correctAnswers!,
              incorrect: cubit.checkedQuestionsInfo.wrongAnswers!,
              size: 132.sp,
              strokeWidth: 8.w,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        Constants.correct,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.blueShades[60],
                            ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            cubit.checkedQuestionsInfo.correctAnswers
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColors.blueShades[60],
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        Constants.inCorrect,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.red,
                            ),
                      ),
                      SizedBox(width: 10.w),
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
                              cubit.checkedQuestionsInfo.wrongAnswers
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: AppColors.red,
                                      fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
              Navigator.pushReplacementNamed(context, Routes.quiz,
                  arguments: examId);
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
