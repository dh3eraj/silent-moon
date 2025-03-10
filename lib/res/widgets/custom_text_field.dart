import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  const CustomTextField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.style,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.cursorColor,
    this.keyboardType,
    this.textAlign = TextAlign.left,
    this.obscuringCharacter = '*',
    this.contentPadding,
    this.decoration,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      cursorColor: Color(0xFF006FFD),
      cursorHeight: 16.r,
      cursorWidth: 1.5.w,
      decoration:
          decoration ??
          InputDecoration(
            contentPadding:
                contentPadding ??
                EdgeInsets.symmetric(vertical: 24, horizontal: 20).w,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
              borderSide: BorderSide(width: 0.15.w, color: Color(0xFFF2F3F7)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
              borderSide: BorderSide(width: 0.15.w, color: Color(0xFFF2F3F7)),
            ),
            filled: true,
            fillColor: Color(0xFFF2F3F7),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle:
                hintStyle ??
                GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFA1A4B2),
                  letterSpacing: 0.05.sp,
                  height: 1.081.sp,
                ),
            constraints: BoxConstraints(minHeight: 63.r, maxHeight: 63.r),
          ),
      keyboardType: keyboardType,
      style:
          style ??
          GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
            color: Color(0xFFA1A4B2),
            letterSpacing: 0.05.sp,
            height: obscureText ? 0.sp : 1.081.sp,
          ),
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
    );
  }
}
