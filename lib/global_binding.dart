import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';

class GlobalBindings extends Bindings {
  late List<CameraDescription> _cameras;
  //
  @override
  void dependencies() async {
    _cameras = await availableCameras();
  }
}
