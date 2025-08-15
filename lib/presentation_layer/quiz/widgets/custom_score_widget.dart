import 'package:flutter/material.dart';
import 'dart:math';

import '../../../core/utils/app_colors.dart';

class CustomScoreCircleProgress extends StatefulWidget {
  final int correct;
  final int incorrect;
  final double size;
  final double strokeWidth;
  final Duration duration;

  const CustomScoreCircleProgress({
    super.key,
    required this.correct,
    required this.incorrect,
    required this.size,
    required this.strokeWidth,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<CustomScoreCircleProgress> createState() =>
      _CustomScoreCircleProgressState();
}

class _CustomScoreCircleProgressState extends State<CustomScoreCircleProgress> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double percent;

  @override
  void initState() {
    super.initState();
    percent = _calculatePercent();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: percent).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CustomScoreCircleProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    double newPercent = _calculatePercent();
    if (newPercent != percent) {
      percent = newPercent;
      _animation = Tween<double>(begin: _animation.value, end: percent).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );
      _controller
        ..reset()
        ..forward();
    }
  }

  double _calculatePercent() {
    int total = widget.correct + widget.incorrect;
    if (total == 0) return 0;
    return widget.correct / total;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _ScoreCirclePainter(
                  percent: _animation.value,
                  strokeWidth: widget.strokeWidth,
                ),
              ),
              Text(
                "${(_animation.value * 100).toInt()}%",
                style: Theme.of(context).textTheme.titleLarge
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ScoreCirclePainter extends CustomPainter {
  final double percent;
  final double strokeWidth;

  _ScoreCirclePainter({
    required this.percent,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = (size.width / 2) - strokeWidth;

    Paint correctPaint = Paint()
      ..color = AppColors.blueShades[60]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    Paint incorrectPaint = Paint()
      ..color = AppColors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startAngle = -pi / 2;
    double correctSweep = 2 * pi * percent;
    double incorrectSweep = 2 * pi * (1 - percent);

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      startAngle,
      incorrectSweep,
      false,
      incorrectPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      startAngle + incorrectSweep,
      correctSweep,
      false,
      correctPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
