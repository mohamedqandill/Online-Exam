import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class CustomOptionsQuestion extends StatefulWidget {
  final List<String> options;
  final ValueChanged<int> onChanged;

  const CustomOptionsQuestion({
    super.key,
    required this.options,
    required this.onChanged,
  });

  @override
  State<CustomOptionsQuestion> createState() => _CustomOptionsQuestionState();
}

class _CustomOptionsQuestionState extends State<CustomOptionsQuestion> {
  int? selectedIndex;

  void selectOption(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widget.options.length, (index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () => selectOption(index),
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
                Radio<int>(
                  value: index,
                  groupValue: selectedIndex,
                  activeColor: AppColors.blueShades[60],
                  onChanged: (_) => selectOption(index),
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
    );
  }
}
