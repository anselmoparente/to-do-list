import 'package:flutter/material.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? suffixIconOnPressed;
  final void Function(String)? onChanged;
  final int? maxLines;

  const CustomTextFormField({
    required this.controller,
    this.hintText,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.onChanged,
    this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      decoration: const BoxDecoration(
        color: ToDoColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 17,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 20,
                  color: Colors.grey,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? TextButton(
                  onPressed: () => suffixIconOnPressed,
                  style: const ButtonStyle(
                    overlayColor:
                        MaterialStatePropertyAll<Color>(Colors.transparent),
                  ),
                  child: Icon(
                    suffixIcon,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
        cursorColor: ToDoColors.buttonPrimary,
        onChanged: onChanged,
      ),
    );
  }
}
