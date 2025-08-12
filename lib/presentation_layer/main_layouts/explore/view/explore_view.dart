import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/constatnts.dart';

import '../widgets/custom_subject_container.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 24.sp,
              ),
              labelText: "Search",
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
            slivers: [
              SliverList.separated(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const CustomSubjectContainer();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16.h);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
