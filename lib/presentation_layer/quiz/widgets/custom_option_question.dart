import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class CustomOptionsQuestion extends StatefulWidget {
  final List<String> options;
  final Function(List<int>) onChanged;

  const CustomOptionsQuestion({
    super.key,
    required this.options,
    required this.onChanged,
  });

  @override
  State<CustomOptionsQuestion> createState() => _CustomOptionsQuestionState();
}

class _CustomOptionsQuestionState extends State<CustomOptionsQuestion> {
  List<int> selectedIndexes = [];

  void toggleOption(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
      widget.onChanged(selectedIndexes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(widget.options.length, (index) {
          final isSelected = selectedIndexes.contains(index);

          return GestureDetector(
            onTap: () => toggleOption(index),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 6.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.blueShades[10]
                    : AppColors.lightBlue,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isSelected,
                    activeColor: AppColors.blueShades[60],
                    onChanged: (_) => toggleOption(index),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      widget.options[index],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
