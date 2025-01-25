// Controlador para manejar el estado
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class VolumeController extends GetxController {
  var isMuted = false.obs; // Variable reactiva para el estado del volumen
  final AudioPlayer audioPlayer = AudioPlayer(); // Instancia del reproductor de audio

  @override
  void onInit() {
    super.onInit();
    _playInitialAudio(); // Reproduce el audio al inicializar el controlador
  }

  Future<void> _playInitialAudio() async {
    try {
      await audioPlayer.play(AssetSource("sonidos/retro_pop.mp3")); // Ruta del archivo de audio
    } catch (e) {
      print("Error al reproducir el audio inicial: $e");
    }
  }

  // Alternar entre silencio y volumen
  void toggleVolume() async {
    isMuted.value = !isMuted.value;
    if (!isMuted.value) {
      // Reproduce el audio cuando se activa el volumen
      await audioPlayer.play(AssetSource("sonidos/retro_pop.mp3"));
    } else {
      // Detener el audio cuando se mutea
      await audioPlayer.stop();
    }
  }
}
