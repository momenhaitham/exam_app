import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class TimerWidget extends StatelessWidget {
  final String timeInMinutes;
  const TimerWidget({super.key, required this.timeInMinutes});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.alarm, color: AppColors.timerGreen, size: 20),
        const SizedBox(width: 4),
        TimerCountdown(
          format: CountDownTimerFormat.minutesSeconds,
          endTime: DateTime.now().add(
            Duration(minutes: int.parse(timeInMinutes)),
          ),
          onEnd: () {
            ShowDialogUtils.showTimeoutDialog(context, () {
              Navigator.pop(context);
            });
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
