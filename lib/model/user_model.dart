// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? message;
  String? status;
  int? balance;
  String? token;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  bool? isVerified;
  String? role;
  String? ownerId;
  String? walletAddress;
  bool? hasWallet;
  String? lastLogin;
  String? profilePictureUrl;
  User({
    this.message,
    this.status,
    this.balance,
    this.token,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.isVerified,
    this.role,
    this.ownerId,
    this.walletAddress,
    this.hasWallet,
    this.lastLogin,
    this.profilePictureUrl,
  });

  User copyWith({
    String? message,
    String? status,
    int? balance,
    String? token,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    bool? isVerified,
    String? role,
    String? ownerId,
    String? walletAddress,
    bool? hasWallet,
    String? lastLogin,
    String? profilePictureUrl,
  }) {
    return User(
      message: message ?? this.message,
      status: status ?? this.status,
      balance: balance ?? this.balance,
      token: token ?? this.token,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isVerified: isVerified ?? this.isVerified,
      role: role ?? this.role,
      ownerId: ownerId ?? this.ownerId,
      walletAddress: walletAddress ?? this.walletAddress,
      hasWallet: hasWallet ?? this.hasWallet,
      lastLogin: lastLogin ?? this.lastLogin,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
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
      'firstName': firstName,
      'lastName': lastName,
      'isVerified': isVerified,
      'role': role,
      'ownerId': ownerId,
      'walletAddress': walletAddress,
      'hasWallet': hasWallet,
      'lastLogin': lastLogin,
      'profilePictureUrl': profilePictureUrl,
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
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      isVerified: map['isVerified'] != null ? map['isVerified'] as bool : null,
      role: map['role'] != null ? map['role'] as String : null,
      ownerId: map['ownerId'] != null ? map['ownerId'] as String : null,
      walletAddress:
          map['walletAddress'] != null ? map['walletAddress'] as String : null,
      hasWallet: map['hasWallet'] != null ? map['hasWallet'] as bool : null,
      lastLogin: map['lastLogin'] != null ? map['lastLogin'] as String : null,
      profilePictureUrl: map['profilePictureUrl'] != null
          ? map['profilePictureUrl'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(message: $message, status: $status, balance: $balance, token: $token, username: $username, email: $email, firstName: $firstName, lastName: $lastName, isVerified: $isVerified, role: $role, ownerId: $ownerId, walletAddress: $walletAddress, hasWallet: $hasWallet, lastLogin: $lastLogin, profilePictureUrl: $profilePictureUrl)';
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
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.isVerified == isVerified &&
        other.role == role &&
        other.ownerId == ownerId &&
        other.walletAddress == walletAddress &&
        other.hasWallet == hasWallet &&
        other.lastLogin == lastLogin &&
        other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        status.hashCode ^
        balance.hashCode ^
        token.hashCode ^
        username.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        isVerified.hashCode ^
        role.hashCode ^
        ownerId.hashCode ^
        walletAddress.hashCode ^
        hasWallet.hashCode ^
        lastLogin.hashCode ^
        profilePictureUrl.hashCode;
  }
}
