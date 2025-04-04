import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login.dart';

class AuthService {
  final String baseUrl = 'https://carros-electricos.wiremockapi.cloud';

  Future<LoginResponse?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error en la autenticación');
    }
  }
}
