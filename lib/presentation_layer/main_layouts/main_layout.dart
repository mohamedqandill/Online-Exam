import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/constatnts.dart';
import 'package:online_exam/presentation_layer/main_layouts/explore/view/explore_view.dart';
import 'package:online_exam/presentation_layer/main_layouts/results/view/result_view.dart';

import '../../core/widgets/main_appBar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [const ExploreView(), const ResultView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Constants.survey,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 25.sp, color: AppColors.blueShades[50]),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
              color: AppColors.blueShades[50], fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(
              color: AppColors.blueShades[50], fontWeight: FontWeight.bold),
          unselectedItemColor: AppColors.blueShades[50],
          unselectedFontSize: 16.sp,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: _selectedIndex == 0
                        ? AppColors.blueShades[20]
                        : Colors.transparent,
                  ),
                  child: Image.asset(
                    AppAssets.exploreIcon,
                    fit: BoxFit.fitHeight,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                label: Constants.explore),
            BottomNavigationBarItem(
                icon: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: _selectedIndex == 1
                        ? AppColors.blueShades[20]
                        : Colors.transparent,
                  ),
                  child: Image.asset(
                    AppAssets.resultIcon,
                    fit: BoxFit.cover,
                    width: 30.w,
                    height: 35.h,
                  ),
                ),
                label: Constants.result),
          ]),
      body: Padding(
        padding: EdgeInsets.all(Constants.appPadding),
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
    );
  }
}
