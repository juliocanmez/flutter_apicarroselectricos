import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car.dart';
import 'token_service.dart';

class CarService {
  final String baseUrl = 'https://carros-electricos.wiremockapi.cloud';

  Future<List<Car>> getCars() async {
    final token = await TokenService.getToken();

    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/carros'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((json) => Car.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener los carros');
    }
  }
}
