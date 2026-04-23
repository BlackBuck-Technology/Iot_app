import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yatritech/utils/api_constants.dart';

class AuthService {
  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required password,
  }) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.registerEndpoint}',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 201 && responseData['success']) {
      return responseData;
    } else {
      throw Exception(responseData['message'] ?? 'Registration failed');
    }
  }

  Future<Map<String, dynamic>> signinUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.loginEndpoint}',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200 && responseData['success']) {
      return responseData;
    } else {
      throw Exception(responseData['message'] ?? "Login failed");
    }
  }
}
