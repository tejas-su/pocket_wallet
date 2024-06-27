// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionModel {
  String? status;
  String? message;
  String? transaction_id;
  int? balance;
  String? wallet_address;
  String? network;
  TransactionModel({
    this.status,
    this.message,
    this.transaction_id,
    this.balance,
    this.wallet_address,
    this.network,
  });

  TransactionModel copyWith({
    String? status,
    String? message,
    String? transaction_id,
    int? balance,
    String? wallet_address,
    String? network,
  }) {
    return TransactionModel(
      status: status ?? this.status,
      message: message ?? this.message,
      transaction_id: transaction_id ?? this.transaction_id,
      balance: balance ?? this.balance,
      wallet_address: wallet_address ?? this.wallet_address,
      network: network ?? this.network,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'transaction_id': transaction_id,
      'balance': balance,
      'wallet_address': wallet_address,
      'network': network,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      transaction_id: map['transaction_id'] != null
          ? map['transaction_id'] as String
          : null,
      balance: map['balance'] != null ? map['balance'] as int : null,
      wallet_address: map['wallet_address'] != null
          ? map['wallet_address'] as String
          : null,
      network: map['network'] != null ? map['network'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(status: $status, message: $message, transaction_id: $transaction_id, balance: $balance, wallet_address: $wallet_address, network: $network)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.transaction_id == transaction_id &&
        other.balance == balance &&
        other.wallet_address == wallet_address &&
        other.network == network;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        message.hashCode ^
        transaction_id.hashCode ^
        balance.hashCode ^
        wallet_address.hashCode ^
        network.hashCode;
  }
}
