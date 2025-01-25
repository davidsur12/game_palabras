import 'package:flutter/material.dart';

class ScreenPregunta extends StatefulWidget {
  final int nivel;
  const ScreenPregunta({super.key, required this.nivel});

  @override
  State<ScreenPregunta> createState() => _ScreenPreguntaState();
}

class _ScreenPreguntaState extends State<ScreenPregunta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child:Text(widget.nivel.toString()),));
  }
}
