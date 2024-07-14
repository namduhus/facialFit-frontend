import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'AuthService.dart';

class ApiService {
  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse('http://34.47.88.29:8082/api/protected-endpoint'),
      headers: <String, String>{
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      print('Data: ${response.body}');
    } else if (response.statusCode == 401) {
      // Access token이 만료된 경우, refresh token을 사용하여 갱신
      await AuthService().refreshAccessToken();
      accessToken = prefs.getString('accessToken');

      // 갱신된 토큰을 사용하여 다시 요청
      final retryResponse = await http.get(
        Uri.parse('http://34.47.88.29:8082/api/protected-endpoint'),
        headers: <String, String>{
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (retryResponse.statusCode == 200) {
        print('Data: ${retryResponse.body}');
      } else {
        throw Exception('Failed to fetch data');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

