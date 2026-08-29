import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/features/auth/login_screen/data/models/user_model.dart';

class HomeAppHeader extends StatelessWidget {
  const HomeAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var userdata = Hive.box<UserModel>(AppConstantBox.userbox).getAt(0);
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: FileImage(File(userdata?.image ?? "")),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good morning", style: AppTextStyles.hinttitles),
              SizedBox(height: 6),
              Text(userdata?.name ?? "", style: AppTextStyles.fieldsubtitles),
            ],
          ),
        ),

        Icon(Icons.notifications),
      ],
    );
  }
}
