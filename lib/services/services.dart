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
    // var headers = {'Flic-Token': token};
    // var data =
    //     '''{\n    "recipient_address": $recipientAddress",\n    "network": "devnet",\n    "sender_address": $sendersAddress,\n    "amount": $amount,\n    "user_pin": $password\n}''';
    var headers = {
      'Flic-Token':
          'flic_30bda133e9a66763f4853217e496dec4ee0afa6ac16e6d1488ce87d708150650'
    };
    var data =
        '''{\n    "recipient_address": "EHWy8SZasjC4Btf6WB9Sxm2jPqkTTk6UTEcHGTdfB4L1",\n    "network": "devnet",\n    "sender_address": "QTA61YXry54KH5S2qJ6kPRtGt7HWtGag27MJq4nN52g",\n    "amount": 945000,\n    "user_pin": "123456"\n}''';

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

  Future<TransactionModel?> getBalance(
    String token,
  ) async {
    var headers = {
      'Flic-Token':
          'flic_30bda133e9a66763f4853217e496dec4ee0afa6ac16e6d1488ce87d708150650'
    };
    var dio = Dio();
    var response = await dio.request(
      '{{local}/solana/wallet/balance?network=devnet&wallet_address=GEBHhY9Safis7Tgd5tdFRVSxs7qjYpES7JEvmh6Wpauf',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
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
