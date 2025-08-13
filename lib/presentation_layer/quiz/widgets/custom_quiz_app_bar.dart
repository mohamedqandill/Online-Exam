import 'package:flutter/material.dart';
import 'package:online_exam/presentation_layer/quiz/widgets/custom_exam_timer.dart';
import '../../../core/utils/constatnts.dart';


class CustomQuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomQuizAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
      child: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_rounded,size: 20,),
        actions: const [
          CustomExamTimer(startMinutes: 30)
        ],
        leadingWidth: 8,
        title: Text(
          Constants.exam,
          style: Theme.of(context)
              .textTheme
              .titleLarge
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
