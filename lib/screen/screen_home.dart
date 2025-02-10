import 'package:flutter/material.dart';
import 'package:game_palabras/controladores/volumen.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/home.dart';
import 'package:game_palabras/utils/cadenas.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final VolumeController volumeController = Get.put(VolumeController());

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop(); // Cierra la aplicación
            return false;
          },
          child: SingleChildScrollView(  // Aquí agregamos el scroll
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => IconButton(
                      icon: Icon(
                        volumeController.isMuted.value ? Icons.volume_off : Icons.volume_up,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        volumeController.toggleVolume(); // Alterna el volumen
                      },
                    )),
                  ],
                ),
                // Imagen en la parte superior
                InkWell(
                  onTap: () {
                    // Puedes agregar la funcionalidad que desees al tocar la imagen
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.0), // Un pequeño margen desde arriba
                    child: Image.asset(
                      "assets/images/logo2.png",
                      width: MediaQuery.of(context).size.width * 0.65, // Ajuste proporcional al ancho de la pantalla
                    ),
                  ),
                ),

                // Animación Lottie en el centro
                InkWell(
                  onTap: () {
                    // Puedes agregar la funcionalidad que desees al tocar la animación
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0), // Espaciado entre la imagen y la animación
                    child: LottieBuilder.asset(
                      "assets/lottie/dinosaurio.json",
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                ),

                // Botón de jugar en la parte inferior con un margen
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0), // Margen desde el fondo
                  child: InkWell(
                    onTap: () {
                      // Aquí se ejecuta la acción del botón de jugar
                    },
                    child: btnPlay(), // Suponiendo que tienes el widget btnPlay()
                  ),
                ),
              ],
            ),
          ),
        ),
      );


    /*
      Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop(); // Cierra la aplicación
            return false; // Evita la navegación hacia atrás normal
          },
          child: SingleChildScrollView( // Permite desplazarse si es necesario
            child: SizedBox(
              height: MediaQuery.of(context).size.height, // Ajusta la altura al tamaño de la pantalla
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() => IconButton(
                        icon: Icon(
                          volumeController.isMuted.value ? Icons.volume_off : Icons.volume_up,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {
                          volumeController.toggleVolume(); // Alterna el volumen
                        },
                      )),
                    ],
                  ),
                  Expanded( // Usa Expanded para asegurar que ocupe el espacio disponible sin desbordarse
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Alinea los elementos al inicio
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min, // Usa MainAxisSize.min para ajustar el tamaño a los widgets
                      //mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido
                      children: [
                        Image.asset(
                          "assets/images/logo2.png",
                          width: MediaQuery.of(context).size.width * 0.6, // Ajuste proporcional al ancho de la pantalla
                        ),
                        LottieBuilder.asset(
                          "assets/lottie/dinosaurio.json",
                          height: MediaQuery.of(context).size.height * 0.5, // Ajusta la altura según sea necesario
                        ),
                        Spacer(),
                        btnPlay(), // Botón de jugar
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

*/




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
