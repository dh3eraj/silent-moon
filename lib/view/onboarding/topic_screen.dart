import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silent_moon/res/constants/svgs.dart';
import 'package:silent_moon/res/widgets/custom_image.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  late final List<String> _items;

  @override
  void initState() {
    _items = [
      Svgs.improvePerformanee,
      Svgs.reduceStress,
      Svgs.reduceStress,
      Svgs.improvePerformanee,
      Svgs.improvePerformanee,
      Svgs.reduceStress,
      Svgs.reduceStress,
      Svgs.improvePerformanee,
      Svgs.improvePerformanee,
      Svgs.reduceStress,
      Svgs.reduceStress,
      Svgs.improvePerformanee,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomImage.svg(
              Svgs.clouds,
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: double.maxFinite, height: 76.h),
                Text(
                  'What Brings you',
                  style: GoogleFonts.poppins(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3F414E),
                    letterSpacing: 0.w,
                    height: 1.35.h,
                  ),
                ),
                Text(
                  'to Silent Moon?',
                  style: GoogleFonts.poppins(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF3F414E),
                    letterSpacing: 0.w,
                    height: 1.35.h,
                  ),
                ),
                11.verticalSpace,
                Text(
                  'choose a topic to focus on:',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFA1A4B2),
                    letterSpacing: 0.w,
                  ),
                ),
                30.verticalSpace,
                // Expanded(
                //   child: GridView.builder(
                //     shrinkWrap: true,
                //     itemCount: _items.length,
                //     itemBuilder: (context, index) {
                //       return CustomImage.svg(_items[index]);
                //     },
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       mainAxisSpacing: 10.w,
                //       crossAxisSpacing: 10.h,
                //     ),
                //   ),
                // ),
                Expanded(
                  child: MasonryGridView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return CustomImage.svg(_items[index]);
                    },
                    mainAxisSpacing: 20.h,
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
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
