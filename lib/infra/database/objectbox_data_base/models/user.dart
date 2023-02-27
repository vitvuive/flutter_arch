// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  final String name;
  final String? phone;
  final ToMany<Device> devices;
  @Id()
  int? id;
  User({
    required this.name,
    required this.devices,
    this.phone,
    this.id,
  });

  User copyWith({
    String? name,
    ToMany<Device>? devices,
    String? phone,
    int? id,
  }) {
    return User(
      name: name ?? this.name,
      devices: devices ?? this.devices,
      phone: phone ?? this.phone,
      id: id ?? this.id,
    );
  }

  @override
  String toString() =>
      'User(name: $name, devices: $devices, phone: $phone, id: $id)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.devices == devices &&
        other.id == id &&
        other.phone == phone;
  }

  @override
  int get hashCode =>
      name.hashCode ^ devices.hashCode ^ id.hashCode ^ name.hashCode;
}

@Entity()
class Device {
  final String deviceName;
  @Id()
  int? id;
  Device({
    required this.deviceName,
    this.id,
  });

  Device copyWith({
    String? deviceName,
    int? id,
  }) {
    return Device(
      deviceName: deviceName ?? this.deviceName,
      id: id ?? this.id,
    );
  }

  @override
  String toString() => 'Device(deviceName: $deviceName, id: $id)';

  @override
  bool operator ==(covariant Device other) {
    if (identical(this, other)) return true;

    return other.deviceName == deviceName && other.id == id;
  }

  @override
  int get hashCode => deviceName.hashCode ^ id.hashCode;
}
