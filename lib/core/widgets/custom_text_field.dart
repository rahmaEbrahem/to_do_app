import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String subtitle;
  TextEditingController? controller;
  CustomTextField({super.key, required this.subtitle, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$subtitle", style: AppTextStyles.fieldsubtitles),
        SizedBox(height: 5),
        TextFormField(
          onTapOutside: (y) {
            FocusScope.of(context).unfocus();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "name is required";
            } else if (value.length > 4) {
              return " name must be greater than 4 character";
            }
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(15),
          ),
          controller: controller,
        ),
      ],
    );
  }
}
