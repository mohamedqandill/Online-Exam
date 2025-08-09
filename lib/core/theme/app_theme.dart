import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/app_colors.dart';

abstract class AppTheme {
  static final ColorScheme _colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blueShades[50]!,
      onPrimary: AppColors.lightBlue,
      secondary: AppColors.green,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.lightRed,
      surface: AppColors.blackShades[50]!,
      onSurface: AppColors.lightGreen);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.blackShades[50],
        size: 21.sp,
      ),
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: AppColors.blueShades[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBlue,
      selectedItemColor: AppColors.blueShades[50],
      unselectedItemColor: AppColors.blueShades[10],
      showSelectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50.sp),
        ),
        borderSide: BorderSide(width: 2.w, color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50.sp),
        ),
        borderSide: BorderSide(width: 2.w, color: AppColors.grey),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50.sp),
        ),
        borderSide: BorderSide(width: 2.w, color: AppColors.grey),
      ),
    ),
    colorScheme: _colorScheme,
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.blackShades[50]),
        bodyMedium: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.blackShades[50]),
        bodySmall: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey),
        titleLarge: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.blackShades[50])),
    cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        )),
  );
}
