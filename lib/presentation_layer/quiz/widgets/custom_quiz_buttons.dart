import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/constatnts.dart';


class CustomQuizButtons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const CustomQuizButtons({
    super.key,
    required this.onBack,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 14.h),
            side: BorderSide(color: AppColors.blueShades[60]!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: onBack,
          child: Text(
            Constants.back,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blueShades[60]),
          ),
        ),

        const SizedBox(width: 16,),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blueShades[60],
            padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: onNext,
          child: Text(
            Constants.next,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}

