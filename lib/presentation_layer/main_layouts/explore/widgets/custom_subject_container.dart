import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CustomSubjectContainer extends StatelessWidget {
  const CustomSubjectContainer(
      {super.key, required this.icon, required this.name});
  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 100.w,
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
            CachedNetworkImage(
              width: 70.w,
              height: 70.h,
              imageUrl: icon,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              name,
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
