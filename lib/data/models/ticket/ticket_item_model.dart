// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class TicketItemModel extends Equatable {
  final String id;
  final String subject;
  final String description;
  final String customer;
  final String email;
  final String brand;
  final String priority;
  final String status;
  final List<String?>? tags;
  final String createdAt;
  const TicketItemModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.customer,
    required this.email,
    required this.brand,
    required this.priority,
    required this.status,
    this.tags,
    required this.createdAt,
  });

  TicketItemModel copyWith({
    String? id,
    String? subject,
    String? description,
    String? customer,
    String? email,
    String? brand,
    String? priority,
    String? status,
    List<String?>? tags,
    String? createdAt,
  }) {
    return TicketItemModel(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      customer: customer ?? this.customer,
      email: email ?? this.email,
      brand: brand ?? this.brand,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subject': subject,
      'description': description,
      'customer': customer,
      'email': email,
      'brand': brand,
      'priority': priority,
      'status': status,
      'tags': tags.map((x) => x?.toMap()).toList(),
      'createdAt': createdAt,
    };
  }

  factory TicketItemModel.fromMap(Map<String, dynamic> map) {
    return TicketItemModel(
      id: map['id'] as String,
      subject: map['subject'] as String,
      description: map['description'] as String,
      customer: map['customer'] as String,
      email: map['email'] as String,
      brand: map['brand'] as String,
      priority: map['priority'] as String,
      status: map['status'] as String,
      tags: map['tags'] != null ? List<String?>.from((map['tags'] as List<int>).map<String??>((x) => String?.fromMap(x as Map<String,dynamic>),),) : null,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketItemModel.fromJson(String source) => TicketItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      subject,
      description,
      customer,
      email,
      brand,
      priority,
      status,
      tags,
      createdAt,
    ];
  }
}
