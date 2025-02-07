import 'package:flutter/material.dart';
import 'package:game_palabras/controladores/volumen.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/game_pregunta.dart';
import 'package:game_palabras/utils/avance.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/theme.dart';

class GameAdivinaPalabra extends StatefulWidget {
  const GameAdivinaPalabra({super.key});

  @override
  State<GameAdivinaPalabra> createState() => _GameAdivinaPalabraState();
}

class _GameAdivinaPalabraState extends State<GameAdivinaPalabra> {
  late ScrollController _scrollController; // ScrollController para controlar el desplazamiento
  int totalItems = 100; // Total de elementos
  int columns = 4; // Número de columnas
  int focusNumber = 75; // Número que queremos enfocar al inicio
  final VolumeController volumeController = Get.put(VolumeController());

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Liberamos el ScrollController
    super.dispose();
  }

  // Función para desplazar al número deseado y centrarlo
  void focusOnItemCentered(int number) {
    int index = totalItems - number; // Convertir el número al índice correspondiente
    double rowHeight = 100; // Altura de cada fila (ajusta según tus widgets)
    double spacing = 10; // Espaciado vertical
    double totalHeight = (rowHeight + spacing) * (index ~/ columns); // Altura acumulada

    // Obtener la altura visible del GridView
    double viewportHeight = MediaQuery.of(context).size.height;

    // Calcular posición centrada
    double centeredPosition = totalHeight - (viewportHeight / 2) + (rowHeight / 2);

    // Animar el desplazamiento asegurando que no exceda los límites
    _scrollController.animateTo(
      centeredPosition.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(

      appBar: AppBar(
        backgroundColor:  MaterialTheme.darkMediumContrastScheme().surface,
        actions: [
          Obx(() => IconButton(
            icon: Icon(
              volumeController.isMuted.value ? Icons.volume_off : Icons.volume_up,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {
              volumeController.toggleVolume(); // Alterna el estado y reproduce sonido
            },
          )),
        ],
        title: FutureBuilder(future: nivelesDesbloqueados().cargarPuntos(nivelesDesbloqueados.keyPuntosAdivinaPalabra), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Cargando..."); // 🔄 Mientras carga
        } else if (snapshot.hasError) {
          return Text("Error");
        } else {
          return Center(child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Text(
                snapshot.data?[nivelesDesbloqueados.keyPuntosAdivinaPalabra].toString() ?? "CARGANDO..",
                style:  GoogleFonts.lato( // Usamos la fuente Lato
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,

                    ))),
            SizedBox(width: 10,),
            Image.asset("assets/images/bolsa_de_dinero.png", width: 50,)
          ],)
          
          ); // ✅ Título cargado
        }

      },),
        automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded( // 🔹 Restringe la altura del GridView
              child: FutureBuilder(
                future: nivelesDesbloqueados().cargarDatos(nivelesDesbloqueados.keyAdivinaPalabra),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    Map<String, dynamic> data = snapshot.data!;
                    focusNumber = data[nivelesDesbloqueados.keyAdivinaPalabra];

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      focusOnItemCentered(focusNumber);
                    });

                    return GridView.builder(
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: totalItems,
                      itemBuilder: (context, index) {
                        int id = totalItems - index;
                        bool desbloqueado = (100 - index) <= data[nivelesDesbloqueados.keyAdivinaPalabra];

                        return nivelItem(screenWidth, id, desbloqueado);
                      },
                    );
                  } else {
                    return Center(child: Text("No hay datos disponibles"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );

    /*
      Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [

          FutureBuilder(
          future: nivelesDesbloqueados().cargarDatos(nivelesDesbloqueados.keyAdivinaPalabra),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(), // Mostrar un indicador de carga mientras se resuelve el Future
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"), // Mostrar un mensaje de error si ocurre uno
              );
            } else if (snapshot.hasData) {
              Map<String, dynamic> data = snapshot.data!;
              focusNumber =data[nivelesDesbloqueados.keyAdivinaPalabra];
              // Una vez que los datos están disponibles, enfocamos el número deseado
              WidgetsBinding.instance.addPostFrameCallback((_) {
                focusOnItemCentered(focusNumber);
              });

              return GridView.builder(
                controller: _scrollController, // Vinculamos el ScrollController
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns, // Número de columnas
                  crossAxisSpacing: 10, // Espacio horizontal entre widgets
                  mainAxisSpacing: 10, // Espacio vertical entre widgets
                ),
                itemCount: totalItems, // Total de elementos
                itemBuilder: (context, index) {
                  int id = totalItems - index;
                  Map<String, dynamic> data = snapshot.data!;

                  bool desbloqueado = (100 - index) <= data[nivelesDesbloqueados.keyAdivinaPalabra]
                      ? true
                      : false;

                  return nivelItem(screenWidth, id, desbloqueado);
                },
              );
            } else {
              return Center(child: Text("No hay datos disponibles"));
            }
          },
        )],)

       ,
      ),
    );

    */
  }

  Widget nivelItem(double screenWidth, int id, bool desbloqueado) {

    if(desbloqueado){
      return nivelItemDesbloqueado(screenWidth, id);
    }
    else{
      return nivelItemBloqueado(screenWidth, id);
    }
    return Container(
        width: screenWidth / 5,
        height: 90,
        decoration: BoxDecoration(

        // color: Color(0xFF40027A),
        gradient: LinearGradient(
        begin: Alignment.topLeft, // Dirección de inicio del gradiente
        end: Alignment.bottomRight, // Dirección final del gradiente
        colors: [
        Colors.purple, // Primer color del degradado
        Colors.pink, // Segundo color del degradado
        ],
    ),
    border: Border.all(color: Colors.red, width: 5.0), // Borde uniforme
    borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
    child: Text(
    "$id",
    textAlign: TextAlign.center,
    style:
    GoogleFonts.lato( // Usamos la fuente Lato
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
    fontSize: 38,
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
    )
    ,
    ));
  }
  Widget nivelItemBloqueado(double screenWidth, int id){

    return Container(
        width: screenWidth / 5,
        height: 90,
        decoration: BoxDecoration(

          // color: Color(0xFF40027A),
          gradient: LinearGradient(
            begin: Alignment.topLeft, // Dirección de inicio del gradiente
            end: Alignment.bottomRight, // Dirección final del gradiente
            colors: [
              Colors.purple, // Primer color del degradado
              Colors.deepPurpleAccent, // Segundo color del degradado
            ],
          ),
          border: Border.all(color: Colors.red, width: 5.0), // Borde uniforme
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "$id",
            textAlign: TextAlign.center,
            style:
            GoogleFonts.lato( // Usamos la fuente Lato
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
                color: Color(0xFF9d9b9b),
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),

            ),
          )
          ,
        ));

  }
  Widget nivelItemDesbloqueado(double screenWidth, int id){
//ScreenPregunta
    return

      GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenPregunta(nivel: id)),
            );
          },
          child:Container(
        width: screenWidth / 5,
        height: 90,
        decoration: BoxDecoration(

          // color: Color(0xFF40027A),
          gradient: LinearGradient(
            begin: Alignment.topLeft, // Dirección de inicio del gradiente
            end: Alignment.bottomRight, // Dirección final del gradiente
            colors: [
              Colors.purple, // Primer color del degradado
              Colors.pink, // Segundo color del degradado
            ],
          ),
          border: Border.all(color: Colors.red, width: 5.0), // Borde uniforme
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "$id",
            textAlign: TextAlign.center,
            style:
            GoogleFonts.lato( // Usamos la fuente Lato
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
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
          )
          ,
        )));

  }

}
