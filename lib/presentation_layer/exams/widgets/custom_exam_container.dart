import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constatnts.dart';

class CustomExamContainer extends StatelessWidget {
  const CustomExamContainer(
      {super.key,
      this.questionNumber,
      required this.durationNumber,
      required this.quizTitle});
  final String? questionNumber;
  final String durationNumber;
  final String quizTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: AppColors.white),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackShades[10]!,
                blurRadius: 4,
                spreadRadius: 0)
          ]),
      child: Padding(
        padding: EdgeInsets.all(Constants.appPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.profit),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quizTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "$questionNumber Questions",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.grey),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "$durationNumber Minutes",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.blueShades[50]),
            )
          ],
        ),
      ),
    );
  }
}
