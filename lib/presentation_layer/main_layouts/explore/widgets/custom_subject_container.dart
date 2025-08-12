import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class CustomSubjectContainer extends StatelessWidget {
  const CustomSubjectContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
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
        padding: EdgeInsets.only(left: 10.sp),
        child: Row(
          children: [
            Image.asset(
              AppAssets.language,
              width: 60.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              "Language",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 21.sp),
            )
          ],
        ),
      ),
    );
  }
}
