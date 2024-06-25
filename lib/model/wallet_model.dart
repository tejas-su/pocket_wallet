// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class WalletModel {
  @HiveField(1)
  String? walletName;
  @HiveField(2)
  String? network;
  @HiveField(3)
  String? userPin;
  @HiveField(4)
  String? recipientAddress;
  @HiveField(5)
  String? senderAddress;
  @HiveField(6)
  int? amount;
  @HiveField(7)
  String? status;
  @HiveField(8)
  String? message;
  @HiveField(9)
  int? balance;
  WalletModel({
    this.walletName,
    this.network,
    this.userPin,
    this.recipientAddress,
    this.senderAddress,
    this.amount,
    this.status,
    this.message,
    this.balance,
  });

  WalletModel copyWith({
    String? walletName,
    String? network,
    String? userPin,
    String? recipientAddress,
    String? senderAddress,
    int? amount,
    String? status,
    String? message,
    int? balance,
  }) {
    return WalletModel(
      walletName: walletName ?? this.walletName,
      network: network ?? this.network,
      userPin: userPin ?? this.userPin,
      recipientAddress: recipientAddress ?? this.recipientAddress,
      senderAddress: senderAddress ?? this.senderAddress,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      message: message ?? this.message,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'walletName': walletName,
      'network': network,
      'userPin': userPin,
      'recipientAddress': recipientAddress,
      'senderAddress': senderAddress,
      'amount': amount,
      'status': status,
      'message': message,
      'balance': balance,
    };
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      walletName:
          map['walletName'] != null ? map['walletName'] as String : null,
      network: map['network'] != null ? map['network'] as String : null,
      userPin: map['userPin'] != null ? map['userPin'] as String : null,
      recipientAddress: map['recipientAddress'] != null
          ? map['recipientAddress'] as String
          : null,
      senderAddress:
          map['senderAddress'] != null ? map['senderAddress'] as String : null,
      amount: map['amount'] != null ? map['amount'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      balance: map['balance'] != null ? map['balance'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletModel.fromJson(String source) =>
      WalletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WalletModel(walletName: $walletName, network: $network, userPin: $userPin, recipientAddress: $recipientAddress, senderAddress: $senderAddress, amount: $amount, status: $status, message: $message, balance: $balance)';
  }

  @override
  bool operator ==(covariant WalletModel other) {
    if (identical(this, other)) return true;

    return other.walletName == walletName &&
        other.network == network &&
        other.userPin == userPin &&
        other.recipientAddress == recipientAddress &&
        other.senderAddress == senderAddress &&
        other.amount == amount &&
        other.status == status &&
        other.message == message &&
        other.balance == balance;
  }

  @override
  int get hashCode {
    return walletName.hashCode ^
        network.hashCode ^
        userPin.hashCode ^
        recipientAddress.hashCode ^
        senderAddress.hashCode ^
        amount.hashCode ^
        status.hashCode ^
        message.hashCode ^
        balance.hashCode;
  }
}
