import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:silent_moon/res/constants/audios.dart';
import 'package:silent_moon/res/constants/svgs.dart';
import 'package:silent_moon/res/widgets/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  late final AudioPlayer _player;

  @override
  void initState() {
    _player = AudioPlayer();
    _player.setAsset(Audios.night);
    _player.play();
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (mounted) {
          context.go("/users");
        }
      }
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    } else if (state == AppLifecycleState.resumed) {
      _player.play();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    _player.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black87,
      body: Center(child: CustomImage.svg(Svgs.splash, fit: BoxFit.cover)),
    );
  }
}
