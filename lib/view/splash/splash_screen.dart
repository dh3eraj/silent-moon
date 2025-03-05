import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silent_moon/utils/logger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
       context.go("/users");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger(MediaQuery.of(context).size.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
