import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/palabras.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenPregunta extends StatefulWidget {
  final int nivel;

  ScreenPregunta({super.key, required this.nivel});

  @override
  State<ScreenPregunta> createState() => _ScreenPreguntaState();
}

class _ScreenPreguntaState extends State<ScreenPregunta> {
  List<bool> btnHabilitados = List.filled(10, true); // Estado de las letras
  String letras = ''; // Inicializar la variable letras con un valor vacío
  String PalabraRespuesta = ""; // Respuesta correcta
  List<bool> presionados = List.filled(10, false); // Estado de las letras presionadas
  List<bool> letrasCorrectas = List.filled(10, false); // Letras correctas

  String letrasIngresadas = "";

  @override
  void initState() {
    super.initState();
    // Calcular las letras una sola vez cuando la pantalla se carga
    List<String>? palabra = Palbras.palabras[widget.nivel];
    String? respuesta = palabra?[0].replaceAll(".", ""); // palabra o respuesta
    letras = completarConLetras(respuesta!, 10);
    letras = mesclarCadena(letras); // Mezclamos las letras una sola vez
  }

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;
    return Scaffold(body: loadPalabra(anchoPantalla, altoPantalla));
  }

  Widget loadPalabra(double anchoPantalla, double altoPantalla) {
    List<String>? palabra = Palbras.palabras[widget.nivel];
    String? pregunta = palabra?[1].replaceAll(".", ""); //pregunta o pista
    String? respuesta = palabra?[0].replaceAll(".", ""); //palabra o respuesta
    respuesta = respuesta!.toUpperCase();
    PalabraRespuesta = respuesta;

    print(respuesta);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 45),
        Center(child: Text("Panabrazos")),
        SizedBox(height: 15),
        Container(
          width: anchoPantalla - (anchoPantalla * 0.05),
          padding: EdgeInsets.only(top: 50, bottom: 50),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            border: Border.all(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            "¿" + pregunta! + "?",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
                shadows: [
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
        tecladoRespuesta(respuesta!.toUpperCase())
      ],
    );
  }

  Widget tecladoRespuesta(String palabra) {
    return Column(
      children: [
        Text(letras.toUpperCase()), // Mostrar las letras sin cambiar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _crearCuadrosLetras(0, 4),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _crearCuadrosLetras(4, 8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _crearCuadrosLetras(8, 10),
        ),
      ],
    );
  }

  List<Widget> _crearCuadrosLetras(int start, int end) {
    List<Widget> letrasWidgets = [];
    for (int i = start; i < end; i++) {
      letrasWidgets.add(letra(i));
    }
    return letrasWidgets;
  }

  String completarConLetras(String base, int totalLength) {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random random = Random();

    // Eliminar espacios de la base y convertir a mayúsculas
    base = base.replaceAll(' ', '').toUpperCase();

    // Usamos un conjunto para asegurarnos de que no haya letras repetidas
    Set<String> usedChars = base.split('').toSet();

    // Si la base ya es más larga que la longitud deseada, la recortamos
    if (base.length >= totalLength) return base.substring(0, totalLength);

    // Filtramos las letras disponibles que aún no han sido usadas
    List<String> availableChars = chars.split('').where((c) => !usedChars.contains(c)).toList();

    // Si no hay suficientes letras disponibles, devolvemos lo que tenemos
    if (availableChars.length + base.length < totalLength) {
      throw Exception("No hay suficientes letras únicas disponibles para completar la cadena.");
    }

    StringBuffer result = StringBuffer(base);

    // Agregar letras aleatorias sin repetir
    while (result.length < totalLength) {
      String randomChar = availableChars.removeAt(random.nextInt(availableChars.length));
      result.write(randomChar);
    }

    return result.toString();
  }

  String mesclarCadena(String input) {
    List<String> chars = input.split('');
    chars.shuffle(Random());
    return chars.join();
  }

  Widget letra(int index) {
    return GestureDetector(
      onTap: () {
        if (!presionados[index]) {
          setState(() {
            presionados[index] = true;
            letrasCorrectas[index] = PalabraRespuesta.contains(letras[index].toUpperCase());
          });
          verificarCompletado();
        }
      },
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: !presionados[index]
              ? Colors.white
              : (letrasCorrectas[index] ? Colors.green : Colors.pink),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            letras[index].toUpperCase(),
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ),
    );
  }

  void verificarCompletado() {
    // Verificar si todas las letras correctas han sido presionadas
    bool completada = true;
    for (int i = 0; i < letras.length; i++) {
      if (PalabraRespuesta.contains(letras[i].toUpperCase()) && !presionados[i]) {
        completada = false; // Si una letra correcta no ha sido presionada, la palabra no está completa
        break;
      }
    }

    // Si todas las letras correctas han sido seleccionadas
    if (completada) {
      print("✅ Cadena completada");
      mostrarMensaje("✅ Cadena completada");
    }
  }

  void mostrarMensaje(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("¡Felicidades!"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

}