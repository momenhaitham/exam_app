import 'package:exam_app_project/core/app_styles.dart';
import 'package:flutter/material.dart';

class CorrectAndIncorrectCountWidget extends StatelessWidget {
  const CorrectAndIncorrectCountWidget({
    super.key,
    required this.text,
    required this.count,
    required this.color,
  });
  final String text;
  final String count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyles.normal20Black.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          alignment: Alignment.center,
          child: Text(
            count,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
