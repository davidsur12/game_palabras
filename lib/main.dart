import 'package:flutter/material.dart';
import 'package:game_palabras/screen/splash_screen/splashScreen.dart';
import 'package:game_palabras/utils/cadenas.dart';
import 'package:get/get.dart';
import 'package:game_palabras/theme/theme.dart';


void main() async {


  WidgetsFlutterBinding.ensureInitialized();
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
        home: SplashScreen()
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
