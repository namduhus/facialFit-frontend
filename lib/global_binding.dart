import 'package:get/instance_manager.dart';
import 'package:iccas_test1/game/controller/scan_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanController>(() => ScanController());
  }
}
