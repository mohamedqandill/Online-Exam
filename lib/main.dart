import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:path_provider/path_provider.dart';

import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';
import 'di.dart';

//add
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.getRoute,
        initialRoute: Routes.main,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
