import 'package:get/get.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanController>(() => ScanController());
  }
}
