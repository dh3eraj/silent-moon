import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silent_moon/res/constants/svgs.dart';
import 'package:silent_moon/res/widgets/custom_image.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  const CustomAppBar({super.key, this.backgroundColor});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      leadingWidth: 75.w,
      leading: Row(
        children: [
          20.horizontalSpace,
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 55.w,
              height: 55.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFEBEAEC),
                border: Border.all(color: Color(0xFF3F414E), width: 1.w),
                shape: BoxShape.circle,
              ),
              child: CustomImage.svg(
                Svgs.arrowLeft,
                width: 18.7,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
