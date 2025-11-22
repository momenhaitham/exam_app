import 'package:exam_app_project/core/app_colors.dart';
import 'package:flutter/material.dart';

class QuestionOptionWidget extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final Function(int) onTap;

  const QuestionOptionWidget({
    super.key,
    required this.text,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.selectedOption
              : AppColors.unSelectedOption,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.checkBookAnswerBlue,
                  width: 3,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        Icons.circle,
                        size: 12,
                        color: isSelected
                            ? AppColors.checkBookAnswerBlue
                            : Colors.transparent,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
