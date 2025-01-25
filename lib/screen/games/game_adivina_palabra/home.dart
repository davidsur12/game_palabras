import 'package:flutter/material.dart';
import 'package:game_palabras/screen/games/game_adivina_palabra/game_pregunta.dart';
import 'package:game_palabras/utils/avance.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Enfocar elemento al inicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
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
        ),
      ),
    );
  }

  /*
      GridView.builder(
        controller: _scrollController, // Vinculamos el ScrollController
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns, // Número de columnas
          crossAxisSpacing: 10, // Espacio horizontal entre widgets
          mainAxisSpacing: 10, // Espacio vertical entre widgets
        ),
        itemCount: totalItems, // Total de elementos
        itemBuilder: (context, index) {
          int id = totalItems - index; // Convertimos índice a número deseado
          bool desbloqueado = id % 2 == 0; // Ejemplo de desbloqueo
          return nivelItem(MediaQuery.of(context).size.width, id, desbloqueado);
        },
      ),
    */
  /*
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(future: nivelesDesbloqueados().cargarDatos(nivelesDesbloqueados.keyAdivinaPalabra), builder: (context, snapshot) {


          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Mostrar un indicador de carga mientras se resuelve el Future
            );
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"), // Mostrar un mensaje de error si ocurre uno
            );
          }

          else if(snapshot.hasData){


           return  GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Número de columnas
                crossAxisSpacing: 10, // Espacio horizontal entre widgets
                mainAxisSpacing: 10, // Espacio vertical entre widgets
              ),
              itemCount: 100, // Total de elementos
              itemBuilder: (context, index) {
                int id = 100 - index;
              //  Map<String, dynamic> nivelDes =await  nivelesDesbloqueados().cargarDatos(nivelesDesbloqueados.keyAdivinaPalabra) as Map<String, dynamic> ;
                Map<String, dynamic> data = snapshot.data!;
                print(data[nivelesDesbloqueados.keyAdivinaPalabra]);
                //bool desbloqueado = id % 2 == 0; // Ejemplo: pares desbloqueados, impares bloqueados
                bool desbloqueado = (100- index) <= data[nivelesDesbloqueados.keyAdivinaPalabra]  ? true : false;

                return nivelItem(screenWidth, id, desbloqueado);
              },
            );
          }
          else{

            return Center(child: Text("no hay datos disponibles"),);
          }

        },)

      ),

    );


  }
  */




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
