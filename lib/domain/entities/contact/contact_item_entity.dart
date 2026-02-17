import 'package:equatable/equatable.dart';

/// Domain Entity for CONTACTITEM
/// 
/// This represents the core business object in the domain layer.
class ContactItemEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String designation;
  final String address;
  final String image;

  const ContactItemEntity({
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

  ContactItemEntity copyWith({
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
    return ContactItemEntity(
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

  @override
  List<Object?> get props => [id, firstName, lastName, email, gender, phone, designation, address, image];

  @override
  String toString() {
    return 'ContactItemEntity{id: \$id, firstName: \$firstName, lastName: \$lastName, email: \$email, gender: \$gender, phone: \$phone, designation: \$designation, address: \$address, image: \$image}';
  }
}