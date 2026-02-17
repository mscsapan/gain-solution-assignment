// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContactItemModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String designation;
  final String address;
  final String image;
  const ContactItemModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.designation,
    required this.address,
    required this.image,
  });

  ContactItemModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? phone,
    String? designation,
    String? address,
    String? image,
  }) {
    return ContactItemModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      designation: designation ?? this.designation,
      address: address ?? this.address,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'gender': gender,
      'phone': phone,
      'designation': designation,
      'address': address,
      'image': image,
    };
  }

  factory ContactItemModel.fromMap(Map<String, dynamic> map) {
    return ContactItemModel(
      id: map['id'] ?? 0,
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      phone: map['phone'] ?? '',
      designation: map['designation'] ?? '',
      address: map['address'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactItemModel.fromJson(String source) => ContactItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      gender,
      phone,
      designation,
      address,
      image,
    ];
  }
}
