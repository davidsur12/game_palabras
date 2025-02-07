import 'package:shared_preferences/shared_preferences.dart';

class nivelesDesbloqueados {
  static const int nivelDesbloqueadoAdivinaPalabra = 1;
  static const String keyAdivinaPalabra = "adivinaPalabra";
  static const String keyPuntosAdivinaPalabra = "puntosAdivinaPalabra";
  static int puntosAdivinaPalbra = 0;

  //metodo guardar datos
  Future<void> saveDataNivelAdivinaPalabra(
      String key, int nivelDesbloqueado) async {
    final sharePreferen =
        await SharedPreferences.getInstance(); //obtengo la instacia
    await sharePreferen.setInt(
        key, nivelDesbloqueado); //guardo el nivel desbloqueado
  }

  Future<void> saveDataPuntosAdivinaPalabra(
      String key, int puntos) async {
    final sharePreferen =
    await SharedPreferences.getInstance(); //obtengo la instacia
    await sharePreferen.setInt(
        key, puntos); //guardo el nivel desbloqueado
  }

  //metodo de cargar datos
  Future<Map<String, dynamic>> cargarDatos(String key) async {
    final sharePreferen =
        await SharedPreferences.getInstance(); //obtengo la instacia
    int nivelDes = sharePreferen.getInt(key) ?? 1;
    return {key: nivelDes};
  }

  Future<Map<String, dynamic>> cargarPuntos(String key) async {
    final sharePreferen =
    await SharedPreferences.getInstance(); //obtengo la instacia
    int nivelDes = sharePreferen.getInt(key) ?? 0;
    return {key: nivelDes};
  }


  //metodo para eliminar dato especifico
Future<void> eliminarDatoEspecifico(String key)async{

  final sharePreferen = await SharedPreferences.getInstance();//obtengo la instacia
  await sharePreferen.remove(key);
}

//metodo limpiar todos los datos
Future<void> LimpiarDatosAdivinaPalabra(String key)async{
  final sharePreferen = await SharedPreferences.getInstance();//obtengo la instacia
  await sharePreferen.clear();
}
}
