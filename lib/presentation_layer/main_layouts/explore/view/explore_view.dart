import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:online_exam/core/utils/constatnts.dart';
import 'package:online_exam/di.dart';
import 'package:online_exam/presentation_layer/main_layouts/explore/manager/explore_cubit.dart';

import '../widgets/custom_subject_container.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExploreCubit>()
        ..getAllSubjects()
        ..onSubjectScroll(),
      child: BlocConsumer<ExploreCubit, ExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<ExploreCubit>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24.sp,
                    ),
                    labelText: Constants.search,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)))),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                Constants.browseByCategory,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24.h,
              ),
              Expanded(
                child: CustomScrollView(
                  controller: cubit.scrollController,
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.zero,
                      sliver: SliverList.separated(
                        itemCount: cubit.subjects.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.exams,
                                  arguments: SubjectData(
                                      id: cubit.subjects[index].id,
                                      title: cubit.subjects[index].name));
                            },
                            child: CustomSubjectContainer(
                              icon: cubit.subjects[index].icon ?? "",
                              name: cubit.subjects[index].name ?? "",
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16.h);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class SubjectData {
  final String? id;
  final String? title;
  SubjectData({required this.title, required this.id});
}
