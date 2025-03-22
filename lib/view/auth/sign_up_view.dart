import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silent_moon/res/constants/app_colors.dart';
import 'package:silent_moon/res/constants/svgs.dart';
import 'package:silent_moon/res/widgets/action_button.dart';
import 'package:silent_moon/res/widgets/custom_app_bar.dart';
import 'package:silent_moon/res/widgets/custom_image.dart';
import 'package:silent_moon/res/widgets/custom_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool checked = false;
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
                  'Create your account',
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
                  hintText: 'Name',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20).w,
                    child: CustomImage.svg(
                      Svgs.tickGreen,
                      width: 14.13.w,
                      height: 9.15.h,
                    ),
                  ),
                ),
                20.verticalSpace,
                CustomTextField(
                  hintText: 'Email address',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20).w,
                    child: CustomImage.svg(
                      Svgs.tickGreen,
                      width: 14.13.w,
                      height: 9.15.h,
                    ),
                  ),
                ),
                20.verticalSpace,
                CustomTextField(
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20).w,
                    child: CustomImage.svg(
                      Svgs.eyeOpen,
                      width: 20.96.w,
                      height: 8.91.h,
                    ),
                  ),
                  obscureText: true,
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'I have read the',
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
                                'Privace Policy',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF7583CA),
                                  letterSpacing: 0.05.sp,
                                  height: 1.081.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.17.w,
                      width: 24.17.h,
                      child: Checkbox(
                        activeColor: Color(0xFFA1A4B2),
                        fillColor: WidgetStatePropertyAll(
                          checked ? Color(0xFFA1A4B2) : Color(0x00A1A4B2),
                        ),
                        checkColor: Color(0xFFFFFFFF),
                        value: checked,
                        onChanged: (value) {
                          setState(() {
                            checked = value ?? false;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFFA1A4B2)),
                          borderRadius: BorderRadius.circular(4).r,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
                32.verticalSpace,
                ActionButton(
                  'GET STARTED',
                  onTap: () {
                    context.go('/welcome');
                  },
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
