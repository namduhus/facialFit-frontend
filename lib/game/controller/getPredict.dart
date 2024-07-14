import 'dart:convert';

import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' show utf8;

class Getpredict {
  //String url = "http://203.241.246.109:10005/predict";
  var uri = Uri.parse("http://203.241.246.109:10005/predict");

  Future<String> predict(XFile file) async {
    Logger().e('predict? Image:${file}#');
/*
    final response = await http.post(Uri.parse(url), body: {
      'file': "$file",
    });
*/
    var request0 = http.MultipartRequest('POST', uri);
    request0.files.add(await http.MultipartFile.fromPath('file', file.path));

    try {
      var streamedResponse = await request0.send();
      var responseData = await streamedResponse.stream.bytesToString();
      var request = await http.Response.fromStream(streamedResponse);
      final decodeMap = json.decode(responseData);

      Logger().e("decodeMap: $decodeMap");

      if (request.statusCode == 200) {
        Logger().e('request.statusCode: ${request.statusCode}');
        String label = request.body.toString();
        var byte = request.bodyBytes.toString();
        Logger().e('request.body: *body $label '); //request.body.toString()
        var decoded = utf8.decode(request.bodyBytes).toString();
        Logger().e('decode: $decoded');
        Logger().e(' *byte?? $byte#  '); //request.body.toString()
        Logger().e('*isnull ${request.body.isEmpty}'); //request.body.toString()

        //Logger().e('request.body: *toString ${} #');

        return request.body;
      } else {
        Logger().e('request.statusCode 400');
      }
    } catch (e) {
      Logger().e("e: $e");
    }
    return 'fail';
  }
}
