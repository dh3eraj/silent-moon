import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silent_moon/res/constants/svgs.dart';
import 'package:silent_moon/res/widgets/action_button.dart';
import 'package:silent_moon/res/widgets/custom_image.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8e97fd),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          50.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Silent',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                  letterSpacing: 1.24.w,
                ),
              ),
              10.horizontalSpace,
              CustomImage.svg(
                Svgs.moonMountainRadial,
                width: 30.w,
                fit: BoxFit.fitWidth,
              ),
              10.horizontalSpace,
              Text(
                'Moon',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                  letterSpacing: 1.24.w,
                ),
              ),
            ],
          ),
          80.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48).w,
            child: Text(
              'Hi Afsar, Welcome',
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFECCC),
                letterSpacing: 1.w,
                height: 1.h,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48).w,
            child: Text(
              'to Silent Moon',
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFECCC),
                letterSpacing: 1.w,
                height: 1.37.h,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            child: Text(
              'Explore the app, Find some peace of mind to prepare for meditation.',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: Color(0xFFEBEAEC),
                letterSpacing: 0.w,
                height: 1.69.h,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          Stack(
            children: [
              CustomImage.svg(
                Svgs.girlMeditation,
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                left: 20.w,
                right: 20.w,
                bottom: 92.h,
                child: ActionButton(
                  'GET STARTED',
                  textColor: Color(0xFF3F414E),
                  backgroundColor: Color(0xFFEBEAEC),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
