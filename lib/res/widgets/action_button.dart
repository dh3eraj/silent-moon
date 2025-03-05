import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silent_moon/res/constants/app_colors.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const ActionButton(this.text, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.actionButton,
          borderRadius: BorderRadius.circular(38),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: GoogleFonts.almarai.toString(),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.actionButtonText,
            height: 1.05,
            letterSpacing: 1.081,
          ),
        ),
      ),
    );
  }
}
