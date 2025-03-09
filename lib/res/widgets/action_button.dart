import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        height: 64.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.actionButton,
          borderRadius: BorderRadius.circular(38).r,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.actionButtonText,
            height: 1.05.sp,
            letterSpacing: 1.081.sp,
          ),
        ),
      ),
    );
  }
}
