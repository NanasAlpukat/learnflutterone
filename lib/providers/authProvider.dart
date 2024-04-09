import 'dart:convert';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  final url = "http://10.0.2.2:8080/api";

  // login
  Future<Response> login(String email, String password) {
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    var result = post(url + '/login', body);

    return result;
  }
}
