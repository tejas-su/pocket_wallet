// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/user_model.dart';

// For login and Sign up Dio functions
class LoginSignupService {
  final _baseUrl = 'https://api.socialverseapp.com';
  final _loginEndpoint = '/user/login';

  Future<User?> login(String mixed, String password) async {
    final dio = Dio();
    final loginData = {'mixed': mixed, 'password': password};

    try {
      var response = await dio.request(
        'https://api.socialverseapp.com/user/login',
        options: Options(
          method: 'POST',
        ),
        data: loginData,
      );

      if (response.statusCode == 200) {
        // return jsonDecode(response.data) as User;
        return User.fromJson(json.encode(response.data));
      } else {
        throw Exception('Status message ${response.statusMessage}');
      }
    } catch (e) {
      //for debugging
    }
  }

  //Signup function
  Future signup(String mixed, String password) async {
    final dio = Dio();
    final signupData = {'wallet_name': mixed, 'user_pin': password};

    try {
      final response = await dio.post(
        Uri.parse('$_baseUrl$_loginEndpoint') as String,
        data: signupData,
      );

      if (response.statusCode == 200) {
        // return jsonDecode(response.data) as User;
        return User.fromJson(json.encode(response.data));
      } else {
        throw Exception('Status message ${response.statusMessage}');
      }
    } catch (e) {
      //for debugging
    }
  }
}
