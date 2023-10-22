import 'package:flutter/material.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData? prefixIcon;
  final bool? isLoading;

  const CustomButton({
    required this.onPressed,
    required this.text,
    this.prefixIcon,
    this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.9,
      height: 48.0,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: ToDoColors.buttonPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (prefixIcon != null)
                ? Container(
                    margin: EdgeInsets.only(
                      left: (prefixIcon != null) ? 12 : 0,
                    ),
                    child: Icon(
                      prefixIcon,
                      color: ToDoColors.white,
                    ),
                  )
                : Container(),
            (isLoading == true)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: EdgeInsets.only(
                      left: (prefixIcon != null) ? 24 : 0,
                    ),
                    child: Text(
                      text,
                      style: const TextStyle(color: ToDoColors.white),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
