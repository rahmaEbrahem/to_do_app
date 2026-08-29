import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String subtitle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? lines;
  final String? descripe;
  final bool? readonly;
  final void Function()? onTap;
  final TextInputType keyboardtype;
  final ispassword;
  const CustomTextField({
    super.key,
    required this.subtitle,
    this.controller,
    this.lines,
    this.descripe,
    this.validator,
    this.readonly,
    this.onTap,
    required this.keyboardtype,
    this.ispassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${widget.subtitle}", style: AppTextStyles.fieldsubtitles),
        SizedBox(height: 5),
        TextFormField(
          maxLines: widget.lines,
          controller: widget.controller,
          readOnly: widget.readonly ?? false,
          onTap: widget.onTap,
          onTapOutside: (y) {
            FocusScope.of(context).unfocus();
          },
          validator: widget.validator,
          keyboardType: widget.keyboardtype,
          obscureText: widget.ispassword && isobscure,
          decoration: InputDecoration(
            suffixIcon: widget.ispassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isobscure = !isobscure;
                      });
                    },
                    child: Icon(
                      isobscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
            hintText: widget.descripe,
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
