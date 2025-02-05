import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/home.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/palabras.dart';
import 'package:game_palabras/utils/avance.dart';
import 'package:game_palabras/utils/cadenas.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ScreenPregunta extends StatefulWidget {
  final int nivel;

  ScreenPregunta({super.key, required this.nivel});

  @override
  State<ScreenPregunta> createState() => _ScreenPreguntaState();
}
class _ScreenPreguntaState extends State<ScreenPregunta> {
  List<bool> btnHabilitados = List.filled(10, true);
  String letras = '';
  String PalabraRespuesta = "";
  List<bool> presionados = List.filled(10, false);
  List<bool> letrasCorrectas = List.filled(10, false);

  String letrasIngresadas = "";
  List<String> palabraMostrada = []; // Lista para mostrar el progreso de la palabra

  ValueNotifier<List<String>> palabraMostradaNotifier = ValueNotifier([]);
  ValueNotifier<List<bool>> presionadosNotifier = ValueNotifier(List.filled(10, false));
  ValueNotifier<List<bool>> letrasCorrectasNotifier = ValueNotifier(List.filled(10, false));


  @override
  void initState() {
    super.initState();
    List<String>? palabra = Palbras.palabras[widget.nivel];
    String? respuesta = palabra?[0].replaceAll(".", "");
    letras = completarConLetras(respuesta!, 10);
    letras = mesclarCadena(letras);

    // Inicializar palabraMostrada con "_" del mismo tamaño que la respuesta
    //PalabraRespuesta = respuesta.toUpperCase();
    PalabraRespuesta = respuesta.replaceAll(" ", "").toUpperCase(); // Eliminar espacios
    PalabraRespuesta = respuesta!;
    PalabraRespuesta=PalabraRespuesta.replaceAll(" ", "");
    palabraMostrada = List.generate(PalabraRespuesta.length, (index) => "_");
    print("el tamaño de la palabra respuesta es ${PalabraRespuesta.length}");
    print("el tamaño de la palabra mostrada es ${palabraMostrada.length}");

    PalabraRespuesta = respuesta!;
    palabraMostradaNotifier.value = List.generate(PalabraRespuesta.length, (index) => "_");

    palabraMostradaNotifier.addListener(() {
      verificarCompletado();
    });
  }

  Future<int> obtenerNivel() async {
    Map<String, dynamic> datos = await nivelesDesbloqueados().cargarDatos(nivelesDesbloqueados.keyAdivinaPalabra);
    return datos[nivelesDesbloqueados.keyAdivinaPalabra] ?? 1;
  }
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    return FutureBuilder<int>(
      future: obtenerNivel(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error al cargar el nivel")),
          );
        }

        int nivel = snapshot.data ?? 1;

        return WillPopScope(
          onWillPop: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => GameAdivinaPalabra() ),
            );
            return false;
          },
          child: Scaffold(
            body: loadPalabra(anchoPantalla, altoPantalla),
          ),
        );
      },
    );
  }

  Widget loadPalabra(double anchoPantalla, double altoPantalla) {
    List<String>? palabra = Palbras.palabras[widget.nivel];
    String? pregunta = palabra?[1].replaceAll(".", "");
    String? respuesta = palabra?[0].replaceAll(".", "");
    respuesta = respuesta!.toUpperCase();
    PalabraRespuesta = respuesta;

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
        SizedBox(height: 20),
        _mostrarPalabra(), // Muestra el progreso de la palabra
        SizedBox(height: 20),
        tecladoRespuesta()
      ],
    );
  }

  Widget _mostrarPalabra() {
    print("la palabra a encontrar es ${palabraMostrada.length}");
    return ValueListenableBuilder<List<String>>(
      valueListenable: palabraMostradaNotifier,
      builder: (context, palabraMostrada, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: palabraMostrada.map((letra) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 2, color: Colors.black)),
              ),
              child: Text(
                letra,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget tecladoRespuesta() {
    return Column(
      children: [
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

  Widget letra(int index) {
    return GestureDetector(
      onTap: () {
        if (!presionadosNotifier.value[index]) {
          presionadosNotifier.value = List.from(presionadosNotifier.value)..[index] = true;
          String letraPresionada = letras[index].toUpperCase();

          if (PalabraRespuesta.contains(letraPresionada)) {
            List<String> nuevaPalabraMostrada = List.from(palabraMostradaNotifier.value);
            for (int i = 0; i < PalabraRespuesta.length; i++) {
              if (PalabraRespuesta[i] == letraPresionada) {
                nuevaPalabraMostrada[i] = letraPresionada;
              }
            }
            palabraMostradaNotifier.value = nuevaPalabraMostrada;
            letrasCorrectasNotifier.value = List.from(letrasCorrectasNotifier.value)..[index] = true;
          } else {
            letrasCorrectasNotifier.value = List.from(letrasCorrectasNotifier.value)..[index] = false;
          }
        }
      },
      child: ValueListenableBuilder<List<bool>>(
        valueListenable: presionadosNotifier,
        builder: (context, presionados, child) {
          return Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: !presionados[index]
                  ? Colors.white
                  : (letrasCorrectasNotifier.value[index] ? Colors.green : Colors.pink),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                letras[index].toUpperCase(),
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          );
        },
      ),
    );
  }


  void verificarCompletado() {
    if (!palabraMostradaNotifier.value.contains("_")) {
      print("✅ Cadena completada");
      mostrarMensaje(Cadenas.get("Nivel_completado"));
    }
  }

  void mostrarMensaje(String mensaje) async {
    Map<String, dynamic> datos = await nivelesDesbloqueados().cargarDatos(nivelesDesbloqueados.keyAdivinaPalabra);
    int nivel = datos[nivelesDesbloqueados.keyAdivinaPalabra] ?? 1;

    if (nivel < 100) {
      nivelesDesbloqueados().saveDataNivelAdivinaPalabra(nivelesDesbloqueados.keyAdivinaPalabra, nivel + 1);
    }

    Future.delayed(Duration(milliseconds: 100), () {
      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: "Felicidades",
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, anim1, anim2) {
          return WillPopScope(
            onWillPop: () async {
              // Redirigir a una pantalla específica al presionar "Atrás"
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => GameAdivinaPalabra()), // Cambia esto por tu pantalla deseada
              );
              return false; // Evita cerrar el diálogo sin navegación
            },
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                CurvedAnimation(parent: anim1, curve: Curves.easeOutBack),
              ),
              child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.deepPurple.shade400,
                contentPadding: EdgeInsets.all(20),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset('assets/lottie/felicidades.json', height: 120),
                    SizedBox(height: 10),
                    Text(
                      "¡Felicidades!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      mensaje,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        print("Nivel actual $nivel, nivel desbloqueado ${nivel + 1}");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenPregunta(nivel: nivel + 1)),
                        );
                      },
                      child: Text("Continuar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return FadeTransition(opacity: anim1, child: child);
        },
      );
    });
  }

/*
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
print("cadena resultante $result"+"ok");
    return result.toString();
  }
  */

  String completarConLetras(String base, int totalLength) {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random random = Random();

    // Convertimos la base a mayúsculas y eliminamos espacios
    base = base.replaceAll(' ', '').toUpperCase();

    // Usamos un conjunto para evitar duplicados
    Set<String> uniqueChars = base.split('').toSet();

    // Si la base ya es más larga que la longitud deseada, la recortamos
    if (uniqueChars.length >= totalLength) {
      return uniqueChars.join().substring(0, totalLength);
    }

    // Filtramos las letras disponibles que aún no han sido usadas
    List<String> availableChars = chars.split('').where((c) => !uniqueChars.contains(c)).toList();

    // Agregar letras aleatorias sin repetir
    while (uniqueChars.length < totalLength) {
      String randomChar = availableChars.removeAt(random.nextInt(availableChars.length));
      uniqueChars.add(randomChar);
    }

    // Convertimos el conjunto a una lista y lo mezclamos
    List<String> shuffledLetters = uniqueChars.toList();
    shuffledLetters.shuffle(random);

    print("Cadena resultante: ${shuffledLetters.join()}");
    return shuffledLetters.join();
  }

  String mesclarCadena(String input) {
    List<String> chars = input.split('');
    chars.shuffle(Random());
    return chars.join();
  }
}

