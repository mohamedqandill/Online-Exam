import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/constatnts.dart';

class CustomExamTimer extends StatefulWidget {
  final int startMinutes;

  const CustomExamTimer({super.key, required this.startMinutes});

  @override
  State<CustomExamTimer> createState() => _CustomExamTimerState();
}

class _CustomExamTimerState extends State<CustomExamTimer> {
  late int remainingSeconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.startMinutes * 60;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        t.cancel();

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.sandAlarm),
                  const SizedBox(width: 8),
                  Text(
                    Constants.timeout,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 24.sp,
                      color: AppColors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueShades[60],
                    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Todo: navigate to the score view
                  },
                  child: Text(
                    Constants.viewScore,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            );
          },
        );

      }
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color timeColor = (remainingSeconds ~/ 60) < 16 ? AppColors.red : AppColors.green;

    return Row(
      children: [
        Image.asset(AppAssets.alarm,width: 24,height: 30),
        const SizedBox(width: 4),
        Text(
          formatTime(remainingSeconds),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: timeColor,
          ),
        ),
      ],
    );
  }
}