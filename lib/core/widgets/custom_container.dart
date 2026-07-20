import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomContainer({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.maincolor,
        ),
        alignment: Alignment.center,
        child: Text(
          "$title",
          style: AppTextStyles.containtitles.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
