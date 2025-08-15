import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/functions/provide_check_body.dart';
import 'package:online_exam/core/widgets/custom_loading.dart';
import 'package:online_exam/presentation_layer/score/manager/score_cubit.dart';
import 'package:online_exam/presentation_layer/score/views/score_view_body.dart';

import '../../../core/utils/constatnts.dart';
import '../../../di.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    var map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var body = provideCheckedQuestionsPOSTBody(map["checkedQuestion"]);
    return BlocProvider(
      create: (context) => getIt<ScoreCubit>()..getScore(body),
      child: Scaffold(
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
        body: BlocConsumer<ScoreCubit, ScoreState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: state is GetScoreSuccess
                    ? ScoreViewBody(
                        examId: map["examId"],
                      )
                    : customLoading(context),
              ),
            );
          },
        ),
      ),
    );
  }
}
