import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/features/login_screen/data/models/user_model.dart';

class HomeAppHeader extends StatelessWidget {
  const HomeAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var userdata = Hive.box<UserModel>(AppConstantBox.userbox).getAt(0);
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: FileImage(File(userdata?.image ?? "")),
          child: Column(
            children: [
              Text("Good morning", style: AppTextStyles.hinttitles),
              Text(userdata?.name ?? "", style: AppTextStyles.fieldsubtitles),
            ],
          ),
        ),
      ],
    );
  }
}
