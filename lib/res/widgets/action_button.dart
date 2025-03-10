import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silent_moon/res/constants/app_colors.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;
  final BoxBorder? border;
  final TextStyle? style;
  final Color? textColor;
  ActionButton(
    this.text, {
    super.key,
    this.onTap,
    this.leading,
    this.trailing,
    this.backgroundColor,
    this.border,
    this.style,
    this.textColor,
  }) {
    assert(style == null || textColor == null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 63.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.actionButton,
          borderRadius: BorderRadius.circular(38).r,
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            24.horizontalSpace,
            leading ?? 0.horizontalSpace,
            Text(
              text,
              style:
                  style ??
                  GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? AppColors.actionButtonText,
                    letterSpacing: 0.05.sp,
                    height: 1.081.sp,
                  ),
            ),
            trailing ?? 0.horizontalSpace,
            24.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
