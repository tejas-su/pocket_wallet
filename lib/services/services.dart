// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_wallet/model/transaction_model.dart';
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
        print('Response body from api: ${response.data}');
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
  //Create wallet function
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

  //Transfer balance function

  Future<TransactionModel?> transferBalance(
      String recipientAddress,
      String sendersAddress,
      String amount,
      String password,
      String token) async {
    var headers = {'Flic-Token': token};
    var data =
        '''{\n    "recipient_address": $recipientAddress",\n    "network": "devnet",\n    "sender_address": $sendersAddress,\n    "amount": $amount,\n    "user_pin": $password\n}''';

    var dio = Dio();
    try {
      var response = await dio.request(
        'https://api.socialverseapp.com/solana/wallet/transfer',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      print('Response body from api: ${response}');
      if (response.statusCode == 200) {
        return TransactionModel.fromJson(jsonEncode(response.data));
      } else {
        Exception('Status message ${response.statusMessage}');
      }
    } catch (e) {
      //
    }
  }

  //airdrop balance
  Future<TransactionModel?> airDrop(
      String wallet_address, String network, String token, int amount) async {
    var headers = {'Flic-Token': token};
    var data =
        '''{\n    "wallet_address": $wallet_address,\n    "network": "devnet",\n    "amount": $amount\n}''';

    var dio = Dio();
    try {
      var response = await dio.request(
        'https://api.socialverseapp.com/solana/wallet/airdrop',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return TransactionModel.fromJson(jsonEncode(response.data));
      } else {
        Exception('Status message ${response.statusMessage}');
      }
    } catch (e) {
      //
    }
  }

  Future<TransactionModel?> getBalance(
      String token, String wallet_address) async {
    var headers = {'Flic-Token': token};
    var dio = Dio();

    try {
      var response = await dio.request(
        'https://api.socialverseapp.com/solana/wallet/balance?network=devnet&wallet_address=GEBHhY9Safis7Tgd5tdFRVSxs7qjYpES7JEvmh6Wpauf',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        return TransactionModel.fromJson(jsonEncode(response.data));
      } else {
        Exception('Status message ${response.statusMessage}');
      }
    } catch (e) {
      //
    }
  }
}

class GetUSerDataFromBox {
  getUserDataFromBox() {
    // var box = await Hive.openBox('users');
    User? datafrombox = Hive.box('users').get('users');
    return datafrombox;
  }
}
