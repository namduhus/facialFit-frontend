import 'package:get/get.dart';

void showPopup(String message) {
  Get.snackbar(
    'Info',
    message,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 2),
  );
}