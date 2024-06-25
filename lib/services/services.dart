// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:my_wallet/model/wallet_model.dart';
import '../model/user_model.dart';

// For login and Sign up Dio functions
class LoginSignupService {
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
      //Local database to store user information and token

      if (response.statusCode == 200) {
        return User.fromJson(json.encode(response.data));
      } else {
        throw Exception('Status message ${response.statusMessage}');
      }
    } catch (e) {
      //for debugging
    }
  }
}

class Wallet {
  Future<WalletModel?> createWallet(
      String walletName, String password, String token) async {
    var headers = {'Flic-Token': token};
    var data =
        '''{\n    "wallet_name": $walletName,\n    "network": "devnet",\n    "user_pin": $password\n}''';
    var dio = Dio();
    try {
      var response = await dio.request(
        'https://api.socialverseapp.com/solana/wallet/create',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return WalletModel.fromJson(jsonEncode(response.data));
      } else {
        throw Exception('Status message ${response.statusMessage}');
      }
    } catch (e) {
      //
    }
  }
}
