import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silent_moon/res/constants/app_colors.dart';
import 'package:silent_moon/res/constants/svgs.dart';
import 'package:silent_moon/res/widgets/action_button.dart';
import 'package:silent_moon/res/widgets/custom_image.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                CustomImage.svg(Svgs.frame, width: 1.sw, fit: BoxFit.fitWidth),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    50.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Silent',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                            letterSpacing: 1.24.sp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomImage.svg(
                            Svgs.moonMountain,
                            width: 30.w,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Moon',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                            letterSpacing: 1.24.sp,
                          ),
                        ),
                      ],
                    ),
                    100.verticalSpace,
                    CustomImage.svg(
                      Svgs.authGirl,
                      width: 332.22.w,
                      height: 242.69.h,
                    ),
                  ],
                ),
              ],
            ),
            40.verticalSpace,
            Text(
              'We are what we do',
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.text,
                height: 1.35.sp,
              ),
            ),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50).w,
              child: Text(
                'Thousand of people are usign silent moon for smalls meditation',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textLight,
                  height: 1.65.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            60.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16).w,
              child: ActionButton(
                'SIGN UP',
                onTap: () {
                  context.go('/auth/signup');
                },
              ),
            ),
            20.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'ALREADY HAVE AN ACCOUNT?',
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textLight,
                      letterSpacing: 0.05.sp,
                      height: 1.081.sp,
                    ),
                  ),
                  WidgetSpan(child: 7.horizontalSpace),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        context.go('/auth/login');
                      },
                      child: Text(
                        'LOG IN',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.actionButton,
                          letterSpacing: 0.05.sp,
                          height: 1.081.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
