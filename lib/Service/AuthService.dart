import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> login(String id, String password) async {
    final response = await http.post(
      Uri.parse('http://34.47.88.29:8082/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final tokens = jsonDecode(response.body);
      final accessToken = tokens['accessToken'];
      final refreshToken = tokens['refreshToken'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', accessToken);
      await prefs.setString('refreshToken', refreshToken);

      // 로그인 시 userId도 저장
      await prefs.setString('userId', id); // 추가된 부분
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> refreshAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');

    final response = await http.post(
      Uri.parse('http://34.47.88.29:8082/api/refresh'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'refreshToken': refreshToken!,
      }),
    );

    if (response.statusCode == 200) {
      final tokens = jsonDecode(response.body);
      final accessToken = tokens['accessToken'];

      await prefs.setString('accessToken', accessToken);
    } else {
      throw Exception('Failed to refresh access token');
    }
  }
}
