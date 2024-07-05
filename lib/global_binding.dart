import 'package:get/instance_manager.dart';
import 'package:SmileHelper/game/controller/scan_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanController>(() => ScanController());
  }
}
