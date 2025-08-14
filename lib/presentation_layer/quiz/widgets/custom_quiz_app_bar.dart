import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constatnts.dart';
import 'custom_exam_timer.dart';

class CustomQuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomQuizAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.h),
      child: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20.w,
            )),
        actions: const [CustomExamTimer(startMinutes: 1)],
        leadingWidth: 8,
        title: Text(Constants.exam, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
