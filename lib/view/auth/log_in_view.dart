import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silent_moon/res/constants/app_colors.dart';
import 'package:silent_moon/res/constants/svgs.dart';
import 'package:silent_moon/res/widgets/action_button.dart';
import 'package:silent_moon/res/widgets/custom_app_bar.dart';
import 'package:silent_moon/res/widgets/custom_image.dart';
import 'package:silent_moon/res/widgets/custom_text_field.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(backgroundColor: Colors.transparent),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomImage.svg(
            Svgs.backgroundHeader,
            width: 1.sw,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                133.47.verticalSpace,
                Text(
                  'Welcome Back!',
                  style: GoogleFonts.poppins(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                    letterSpacing: 0.sp,
                    height: 1.35.sp,
                  ),
                ),
                33.verticalSpace,
                ActionButton(
                  'CONTINUE WITH FACEBOOK',
                  leading: CustomImage.svg(Svgs.facebook),
                  backgroundColor: Color(0xFF7583CA),
                ),
                20.verticalSpace,
                ActionButton(
                  'CONTINUE WITH GOOGLE',
                  leading: CustomImage.svg(Svgs.google),
                  backgroundColor: Color(0xFFFFFFFF),
                  border: Border.all(color: Color(0xFFEBEAEC)),
                  textColor: Color(0xFF3F414E),
                ),
                40.verticalSpace,
                Text(
                  'OR LOG IN WITH EMAIL',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFA1A4B2),
                    letterSpacing: 0.05.sp,
                    height: 1.081.sp,
                  ),
                ),
                40.verticalSpace,
                CustomTextField(
                  hintText: 'Email address',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                20.verticalSpace,
                CustomTextField(
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                30.verticalSpace,
                ActionButton('LOG IN'),
                20.verticalSpace,
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3F414E),
                    letterSpacing: 0.05.sp,
                    height: 1.081.sp,
                  ),
                ),
                100.verticalSpace,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'DON\'T HAVE AN ACCOUNT?',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFA1A4B2),
                          letterSpacing: 0.05.sp,
                          height: 1.081.sp,
                        ),
                      ),
                      WidgetSpan(child: 7.horizontalSpace),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF8E97FD),
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
        ],
      ),
    );
  }
}
