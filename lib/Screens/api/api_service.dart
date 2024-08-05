import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {}

class AuthProvider with ChangeNotifier {
  final String _baseUrl = 'https://reqres.in/api';

  Future<Map<String, dynamic>> register(String email, String password) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return {'error': 'Failed to register: ${response.reasonPhrase}'};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'error': 'Failed to login: ${response.reasonPhrase}'};
    }
  }
}
