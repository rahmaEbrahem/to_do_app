import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/helper/app_preferences.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';

class HomeAppHeader extends StatelessWidget {
  const HomeAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final name = AppPreferences.getUserName();

    return Row(
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.list_alt_outlined)),
        10.verticalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good morning", style: AppTextStyles.hinttitles),
              6.verticalSpace,
              Text(name ?? "", style: AppTextStyles.fieldsubtitles),
            ],
          ),
        ),
        const Icon(Icons.notifications),
      ],
    );
  }
}
