import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_scroll_behavior.dart';

class CustomQuestionsPageView extends StatelessWidget {
  final PageController controller;
  final List<Widget> pages;
  final void Function(int)? onPageChanged;

  const CustomQuestionsPageView({
    super.key,
    required this.controller,
    required this.pages,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: PageView(
        onPageChanged: onPageChanged,
        scrollBehavior: NoGlowScrollBehavior(),
        controller: controller,
        children: pages,
      ),
    );
  }
}
