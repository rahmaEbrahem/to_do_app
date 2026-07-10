import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  const CustomContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.maincolor,
      ),
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        "$title",
        style: AppTextStyles.containtitles.copyWith(color: Colors.white),
      ),
    );
  }
}
