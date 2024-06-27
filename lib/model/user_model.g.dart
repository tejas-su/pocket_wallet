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
      first_name: fields[6] as String?,
      last_name: fields[7] as String?,
      isVerified: fields[8] as bool?,
      role: fields[9] as String?,
      owner_id: fields[10] as String?,
      wallet_address: fields[11] as String?,
      has_wallet: fields[12] as bool?,
      last_login: fields[13] as String?,
      profile_picture_url: fields[14] as String?,
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
      ..write(obj.first_name)
      ..writeByte(7)
      ..write(obj.last_name)
      ..writeByte(8)
      ..write(obj.isVerified)
      ..writeByte(9)
      ..write(obj.role)
      ..writeByte(10)
      ..write(obj.owner_id)
      ..writeByte(11)
      ..write(obj.wallet_address)
      ..writeByte(12)
      ..write(obj.has_wallet)
      ..writeByte(13)
      ..write(obj.last_login)
      ..writeByte(14)
      ..write(obj.profile_picture_url);
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
