// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      message: fields[0] as String?,
      status: fields[1] as String?,
      balance: fields[2] as int?,
      token: fields[3] as String?,
      username: fields[4] as String?,
      email: fields[5] as String?,
      firstName: fields[6] as String?,
      lastName: fields[7] as String?,
      isVerified: fields[8] as bool?,
      role: fields[9] as String?,
      ownerId: fields[10] as String?,
      walletAddress: fields[11] as String?,
      hasWallet: fields[12] as bool?,
      lastLogin: fields[13] as String?,
      profilePictureUrl: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.firstName)
      ..writeByte(7)
      ..write(obj.lastName)
      ..writeByte(8)
      ..write(obj.isVerified)
      ..writeByte(9)
      ..write(obj.role)
      ..writeByte(10)
      ..write(obj.ownerId)
      ..writeByte(11)
      ..write(obj.walletAddress)
      ..writeByte(12)
      ..write(obj.hasWallet)
      ..writeByte(13)
      ..write(obj.lastLogin)
      ..writeByte(14)
      ..write(obj.profilePictureUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
