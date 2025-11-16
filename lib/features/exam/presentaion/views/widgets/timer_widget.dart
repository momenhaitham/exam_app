import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class TimerWidget extends StatefulWidget {
  final String timeInMinutes;
  final void Function() onTimeEnded;

  const TimerWidget({
    super.key,
    required this.timeInMinutes,
    required this.onTimeEnded,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late DateTime endTime;

  @override
  void initState() {
    super.initState();
    final minutes = int.tryParse(widget.timeInMinutes) ?? 0;
    endTime = DateTime.now().add(Duration(minutes: minutes));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.alarm, color: AppColors.timerGreen, size: 20),
        const SizedBox(width: 4),
        TimerCountdown(
          format: CountDownTimerFormat.minutesSeconds,
          endTime: endTime,
          onEnd: () {
            ShowDialogUtils.showTimeoutDialog(context, widget.onTimeEnded);
          },
          spacerWidth: 2,
          enableDescriptions: false,
          timeTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.timerGreen,
          ),
        ),
      ],
    );
  }
}
