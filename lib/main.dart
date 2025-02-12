import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/game_pregunta.dart';
import 'package:game_palabras/screen/screen_home.dart';
import 'package:game_palabras/screen/splash_screen/splashScreen.dart';
import 'package:game_palabras/utils/cadenas.dart';
import 'package:get/get.dart';
import 'package:game_palabras/theme/theme.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';




void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  MobileAds.instance.updateRequestConfiguration(
    RequestConfiguration(testDeviceIds: ['ABC123XYZ']),
  );

  await Cadenas.loadStrings();
  // runApp(const MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: MaterialTheme.lightScheme(),
            textTheme: TextTheme(
                //bodyText1:TextStyle(fontSize: 20)
                )),
        darkTheme:
            ThemeData(colorScheme: MaterialTheme.darkMediumContrastScheme()),
       themeMode: ThemeMode.dark,
        home: ScreenHome()//SplashScreen()
        //const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
