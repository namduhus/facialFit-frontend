import 'dart:async';
import 'dart:typed_data';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CameraManager extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;
  final RxBool _isInitialized = RxBool(false);
  CameraImage? _cameraImage;
  final RxList<Uint8List> _imageList = RxList([]);

  CameraManager({required List<CameraDescription> cameras}) {
    _cameras = cameras;
  }

  CameraController get cameraController => _cameraController;
  bool get isInitialized => _isInitialized.value;
  List<Uint8List> get imageList => _imageList;

  @override
  void onInit() async {
    super.onInit();
    await _initCamera();
  }

  Future<void> _initCamera() async {
    Logger().e('_initCamera()');
    try {
      _cameraController = CameraController(
        _cameras[1], ResolutionPreset.veryHigh,
        imageFormatGroup: ImageFormatGroup.jpeg, enableAudio: false,
      );

      await _cameraController.initialize();
      _isInitialized.value = true;
      await _cameraController.startImageStream((CameraImage image) async {
        _cameraImage = image;
      });
      _isInitialized.refresh();
    } on CameraException catch (e) {
      Logger().e('CameraException: ${e.code}');
      _showErrorSnackbar('Failed to initialize camera: ${e.code}');
    } catch (e) {
      Logger().e('Unknown error: $e');
      _showErrorSnackbar('Unknown error occurred while initializing camera');
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<XFile?> takePicture() async {
    if (!_cameraController.value.isInitialized || _cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      final XFile file = await _cameraController.takePicture();
      final Uint8List bytes = await File(file.path).readAsBytes();
      _imageList.add(bytes);
      _imageList.refresh();
      return file;
    } on CameraException catch (e) {
      Logger().e('CameraException: $e');
      return null;
    }
  }

  void clearImageList() {
    _imageList.clear();
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }
}