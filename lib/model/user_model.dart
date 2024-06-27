// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive_flutter/adapters.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String? message;
  @HiveField(1)
  String? status;
  @HiveField(2)
  int? balance;
  @HiveField(3)
  String? token;
  @HiveField(4)
  String? username;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? first_name;
  @HiveField(7)
  String? last_name;
  @HiveField(8)
  bool? isVerified;
  @HiveField(9)
  String? role;
  @HiveField(10)
  String? owner_id;
  @HiveField(11)
  String? wallet_address;
  @HiveField(12)
  bool? has_wallet;
  @HiveField(13)
  String? last_login;
  @HiveField(14)
  String? profile_picture_url;
  User({
    this.message,
    this.status,
    this.balance,
    this.token,
    this.username,
    this.email,
    this.first_name,
    this.last_name,
    this.isVerified,
    this.role,
    this.owner_id,
    this.wallet_address,
    this.has_wallet,
    this.last_login,
    this.profile_picture_url,
  });

  User copyWith({
    String? message,
    String? status,
    int? balance,
    String? token,
    String? username,
    String? email,
    String? first_name,
    String? last_name,
    bool? isVerified,
    String? role,
    String? owner_id,
    String? wallet_address,
    bool? has_wallet,
    String? last_login,
    String? profile_picture_url,
  }) {
    return User(
      message: message ?? this.message,
      status: status ?? this.status,
      balance: balance ?? this.balance,
      token: token ?? this.token,
      username: username ?? this.username,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      isVerified: isVerified ?? this.isVerified,
      role: role ?? this.role,
      owner_id: owner_id ?? this.owner_id,
      wallet_address: wallet_address ?? this.wallet_address,
      has_wallet: has_wallet ?? this.has_wallet,
      last_login: last_login ?? this.last_login,
      profile_picture_url: profile_picture_url ?? this.profile_picture_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'balance': balance,
      'token': token,
      'username': username,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'isVerified': isVerified,
      'role': role,
      'owner_id': owner_id,
      'wallet_address': wallet_address,
      'has_wallet': has_wallet,
      'last_login': last_login,
      'profile_picture_url': profile_picture_url,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      message: map['message'] != null ? map['message'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      balance: map['balance'] != null ? map['balance'] as int : null,
      token: map['token'] != null ? map['token'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      isVerified: map['isVerified'] != null ? map['isVerified'] as bool : null,
      role: map['role'] != null ? map['role'] as String : null,
      owner_id: map['owner_id'] != null ? map['owner_id'] as String : null,
      wallet_address: map['wallet_address'] != null
          ? map['wallet_address'] as String
          : null,
      has_wallet: map['has_wallet'] != null ? map['has_wallet'] as bool : null,
      last_login:
          map['last_login'] != null ? map['last_login'] as String : null,
      profile_picture_url: map['profile_picture_url'] != null
          ? map['profile_picture_url'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(message: $message, status: $status, balance: $balance, token: $token, username: $username, email: $email, first_name: $first_name, last_name: $last_name, isVerified: $isVerified, role: $role, owner_id: $owner_id, wallet_address: $wallet_address, has_wallet: $has_wallet, last_login: $last_login, profile_picture_url: $profile_picture_url)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.balance == balance &&
        other.token == token &&
        other.username == username &&
        other.email == email &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.isVerified == isVerified &&
        other.role == role &&
        other.owner_id == owner_id &&
        other.wallet_address == wallet_address &&
        other.has_wallet == has_wallet &&
        other.last_login == last_login &&
        other.profile_picture_url == profile_picture_url;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        status.hashCode ^
        balance.hashCode ^
        token.hashCode ^
        username.hashCode ^
        email.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        isVerified.hashCode ^
        role.hashCode ^
        owner_id.hashCode ^
        wallet_address.hashCode ^
        has_wallet.hashCode ^
        last_login.hashCode ^
        profile_picture_url.hashCode;
  }
}
