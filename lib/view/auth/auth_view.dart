import 'package:flutter/material.dart';
import 'package:silent_moon/res/constants/app_colors.dart';
import 'package:silent_moon/res/constants/svgs.dart';
import 'package:silent_moon/res/widgets/action_button.dart';
import 'package:silent_moon/res/widgets/custom_image.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.bg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              CustomImage.svg(
                Svgs.frame,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: AppBar().preferredSize.height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Silent',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text,
                          letterSpacing: 1.24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomImage.svg(
                          Svgs.moonMountain,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Text(
                        'Moon',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text,
                          letterSpacing: 1.24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  CustomImage.svg(Svgs.authGirl, width: 332.22, height: 242.69),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          Text(
            'We are what we do',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.text,
              height: 1.35,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Thousand of people are usign silent moon for smalls meditation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.textLight,
                height: 1.65,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ActionButton('SIGN UP'),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'ALREADY HAVE AN ACCOUNT?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textLight,
                    height: 1.05,
                    letterSpacing: 1.081,
                  ),
                ),
                WidgetSpan(child: SizedBox(width: 10)),
                TextSpan(
                  text: 'LOG IN',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.actionButton,
                    height: 1.05,
                    letterSpacing: 1.081,
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
