import 'package:camera/camera.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  late List<CameraDescription> _cameras;
  //
  @override
  void dependencies() async {
    _cameras = await availableCameras();
  }
}
