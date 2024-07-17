import 'package:get/get.dart';

class StageController extends GetxController {
  var currentStage = 0.obs;

  void setStage(int stage) {
    currentStage.value = stage;
  }
}
