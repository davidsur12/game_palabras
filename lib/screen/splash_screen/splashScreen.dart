import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:game_palabras/main.dart';
import 'package:game_palabras/screen/screen_home.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrar contenido
        children: [
          Expanded(
            child: Center(
              child: LottieBuilder.asset("assets/lottie/dinosaurio.json"),
            ),
          ),
        ],
      ),
      nextScreen:  ScreenHome(), //MyHomePage(title: "saludo"),
      backgroundColor: Colors.blue,
      splashIconSize: 400,
    );
  }
}
