import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum UserRole { tourist, guide }

extension UserRoleExtension on UserRole {
  String get name {
    switch (this) {
      case UserRole.tourist:
        return 'tourist';
      case UserRole.guide:
        return 'guide';
      default:
        return '';
    }
  }

  static UserRole fromName(String name) {
    switch (name) {
      case 'tourist':
        return UserRole.tourist;
      case 'guide':
        return UserRole.guide;
      default:
        throw Exception('Invalid role');
    }
  }
}

class UserModel {
  String uid;
  String fullName;
  String email;
  UserRole role;
  DateTime dateOfBirth;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.role,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'role': role.name,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      role: UserRoleExtension.fromName(map['role']),
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel.fromMap(data);
  }
}
