import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class CustomQuestionListView extends StatefulWidget {
  final List<String> options;
  final String questions;
  final String userAnswer;
  final String correctAnswer;

  const CustomQuestionListView({
    super.key,
    required this.options,
    required this.questions,
    required this.userAnswer,
    required this.correctAnswer,
  });

  @override
  State<CustomQuestionListView> createState() => _CustomQuestionListViewState();
}

class _CustomQuestionListViewState extends State<CustomQuestionListView> {
  @override
  Widget build(BuildContext context) {
    int correctIndex = int.tryParse(widget.correctAnswer.substring(1)) ?? -1;
    correctIndex -= 1;

    int userIndex = int.tryParse(widget.userAnswer.substring(1)) ?? -1;
    userIndex -= 1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.questions,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 20.sp),
          ),
          ...List.generate(widget.options.length, (index) {
            Color containerColor = AppColors.lightBlue;
            bool isChecked = false;

            if (widget.userAnswer == widget.correctAnswer) {
              if (index == correctIndex) {
                containerColor = AppColors.lightGreen;
                isChecked = true;
              }
            } else {
              if (index == correctIndex) {
                containerColor = AppColors.lightGreen;
                isChecked = true;
              } else if (index == userIndex) {
                containerColor = AppColors.red;
                isChecked = true;
              }
            }

            return Container(
              margin: EdgeInsets.symmetric(vertical: 6.h),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: null,
                    activeColor: containerColor == AppColors.lightGreen
                        ? AppColors.lightGreen
                        : AppColors.red,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      widget.options[index],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
