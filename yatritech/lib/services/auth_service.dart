import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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

      //getting Jwt token
      final String token = responseData['data']['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
      
      return responseData;
    } else {
      throw Exception(responseData['message'] ?? "Login failed");
    }
  }

  Future<Map<String, dynamic>> forgotPassword({required String email}) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.forgotPasswordEndpoint}',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200 && responseData['success']) {
      return responseData;
    } else {
      throw Exception(responseData['message'] ?? "Password Reset Failed");
    }
  }

  Future<Map<String, dynamic>> updatePassword({
    required String password,
  }) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.updatePasswordEndpoint}',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'password': password}),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200 && responseData['success']) {
      return responseData;
    } else {
      throw Exception(responseData['message'] ?? "Password Reset Failed");
    }
  }

  Future<Map<String, dynamic>> verifyOtp({required String otp}) async {
    final url = Uri.parse('${ApiConstants.baseUrl}');

    final response = await http.post(url);

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200 && responseData['success']) {
      return responseData;
    } else {
      throw Exception(responseData['message'] ?? "OTP Verification Failed");
    }
  }
}
