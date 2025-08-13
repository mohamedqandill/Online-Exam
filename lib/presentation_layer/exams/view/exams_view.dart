import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/widgets/main_appBar.dart';
import 'package:online_exam/presentation_layer/exams/manager/exams_cubit.dart';
import 'package:online_exam/presentation_layer/main_layouts/explore/view/explore_view.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constatnts.dart';
import '../../../core/widgets/custom_empty_data_widget.dart';
import '../../../core/widgets/custom_loading.dart';
import '../../../di.dart';
import '../widgets/custom_exam_container.dart';

class ExamsView extends StatelessWidget {
  const ExamsView({super.key});

  @override
  Widget build(BuildContext context) {
    var subjectInfo = ModalRoute.of(context)!.settings.arguments as SubjectData;
    return BlocProvider(
      create: (context) => getIt<ExamsCubit>()
        ..getExamsOnSubjects(subjectId: subjectInfo.id ?? ""),
      child: BlocConsumer<ExamsCubit, ExamsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<ExamsCubit>(context);
          return Scaffold(
              appBar: MainAppBar(
                title: Text(
                  Constants.language,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color: AppColors.blackShades[50]),
                ),
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.sp,
                  ),
                ),
              ),
              body: state is GetExamsLoading
                  ? customLoading(context)
                  : cubit.exams.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.all(Constants.appPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                subjectInfo.title ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Expanded(
                                child: CustomScrollView(
                                  slivers: [
                                    SliverList.separated(
                                      itemCount: cubit.exams.length,
                                      itemBuilder: (context, index) {
                                        return CustomExamContainer(
                                          quizTitle:
                                              cubit.exams[index].title ?? "",
                                          durationNumber: cubit
                                              .exams[index].duration
                                              .toString(),
                                          questionNumber: cubit
                                              .exams[index].numberOfQuestions
                                              .toString(),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 10.h,
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : const CustomEmptyDataWidget());
        },
      ),
    );
  }
}
