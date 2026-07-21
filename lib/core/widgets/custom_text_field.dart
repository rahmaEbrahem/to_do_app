import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String subtitle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? lines;
  final String? descripe;
  final bool? readonly;
  final void Function()? onTap;
  const CustomTextField({
    super.key,
    required this.subtitle,
    this.controller,
    this.lines,
    this.descripe,
    this.validator,
    this.readonly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$subtitle", style: AppTextStyles.fieldsubtitles),
        SizedBox(height: 5),
        TextFormField(
          maxLines: lines,
          controller: controller,
          readOnly: readonly ?? false,
          onTap: onTap,
          onTapOutside: (y) {
            FocusScope.of(context).unfocus();
          },
          validator: validator,
          decoration: InputDecoration(
            hintText: descripe,
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
        ),
      ],
    );
  }
}
