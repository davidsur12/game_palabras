import 'package:flutter/material.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/palabras.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenPregunta extends StatefulWidget {
  final int nivel;

  const ScreenPregunta({super.key, required this.nivel});

  @override
  State<ScreenPregunta> createState() => _ScreenPreguntaState();
}

class _ScreenPreguntaState extends State<ScreenPregunta> {
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;
    return Scaffold(body: loadPalabra(anchoPantalla, altoPantalla));
  }

  Widget loadPalabra(double anchoPantalla, double altoPantalla) {
    //cargar nivel

    List<String>? palabra = Palbras.palabras[widget.nivel];
    String? pregunta = palabra?[1].replaceAll(".", ""); //pregunta o pista
    String? repuesta = palabra?[0].replaceAll(".", ""); //palabra o respuesta
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        SizedBox(height: 45),
        Center(child: Text("Panabrazos")),
        SizedBox(height: 15),
        Container(
          width: anchoPantalla - (anchoPantalla * 0.05),
          //color: Colors.deepPurple,
          padding: EdgeInsets.only(top: 50, bottom: 50),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
            border: Border.all(color: Colors.white,
            width: 3.0),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Text(
            "¿" + pregunta! + "?",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              // Usamos la fuente Lato
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
                shadows: [
                  //sombra al texto
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        //palabras  con que responder teclado
      ],
    );
  }
}
