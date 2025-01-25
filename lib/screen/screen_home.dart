import 'package:flutter/material.dart';
import 'package:game_palabras/controladores/volumen.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/home.dart';
import 'package:game_palabras/utils/cadenas.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final VolumeController volumeController = Get.put(VolumeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
    Center(
    child: Obx(() => IconButton(
    icon: Icon(
    volumeController.isMuted.value ? Icons.volume_off : Icons.volume_up,
    color: Colors.white,
    size: 30.0,
    ),
    onPressed: () {
    volumeController.toggleVolume(); // Alterna el estado y reproduce sonido
    },
    )),)
            ],),

         Center(child: Text(Cadenas.get("app_name"))),
            LottieBuilder.asset("assets/lottie/dinosaurio.json"),
          btnPlay()



          ],)

    );
  }


  Widget btnPlay(){

    return

      Center(

        child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Fondo del contenedor
              borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color de la sombra
                  spreadRadius: 2, // Expansión de la sombra
                  blurRadius: 5, // Desenfoque de la sombra
                  offset: Offset(0, 3), // Desplazamiento horizontal y vertical
                ),
              ],
            ),
            child: SizedBox(
          width: 200.0, // Ancho específico del botón
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GameAdivinaPalabra()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Define el radio de los bordes
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0), // Altura del botón
              backgroundColor: Colors.deepPurple, // Color de fondo
            ),
            child: Text(
              Cadenas.get("jugar"),
              style: TextStyle(fontSize: 16.0, color: Colors.white), // Estilo del texto
            ),
          ),
        ),
          ),

      );

  }
}
