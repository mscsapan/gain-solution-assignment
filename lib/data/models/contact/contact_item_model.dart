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
      'firstName': firstName,
      'lastName': lastName,
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
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
      phone: map['phone'] as String,
      designation: map['designation'] as String,
      address: map['address'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactItemModel.fromJson(String source) =>
      ContactItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
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
