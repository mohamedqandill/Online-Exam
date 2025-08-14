import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_one/presentation_layer/quiz/view/score_view_body.dart';
import '../../../core/utils/constatnts.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 8,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20.w,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            Constants.exam,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: ScoreViewBody(),
        ),
      ),
    );
  }
}
