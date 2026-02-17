// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:gain_solution_task/presentation/cubit/ticket/ticket_cubit.dart';

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
  final TicketState ticketState;
  const TicketItemModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.customer,
    required this.email,
    required this.brand,
    required this.priority,
    required this.status,
    required this.tags,
    required this.createdAt,
    this.ticketState =  const TicketInitial(),
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
    TicketState? ticketState,
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
      ticketState: ticketState ?? this.ticketState,
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
      'tags': tags?.map((x) => x).toList(),
      'createdAt': createdAt,
    };
  }

  factory TicketItemModel.fromMap(Map<String, dynamic> map) {
    return TicketItemModel(
      id: map['id'] ?? 0,
      subject: map['subject'] ?? '',
      description: map['description'] ?? '',
      customer: map['customer'] ?? '',
      email: map['email'] ?? '',
      brand: map['brand'] ?? '',
      priority: map['priority'] ?? '',
      status: map['status'] ?? '',
      tags: map['tags'] != null ? List<String?>.from((map['tags'] as List<dynamic>).map<String?>((x) => x.toString())) : [],
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketItemModel.fromJson(String source) => TicketItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  static TicketItemModel init(){
    return TicketItemModel(
      id : '',
      subject : '',
      description : '',
      customer : '',
      email : '',
      brand : '',
      priority : '',
      status : '',
      tags : const [],
      createdAt : '',
      ticketState :  const TicketInitial(),
    );
  }

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
      ticketState,
    ];
  }
}
