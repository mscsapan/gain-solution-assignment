import 'package:equatable/equatable.dart';

/// Domain Entity for TICKETITEM
/// 
/// This represents the core business object in the domain layer.
class TicketItemEntity extends Equatable {
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

  const TicketItemEntity({
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
  });

  TicketItemEntity copyWith({
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
    return TicketItemEntity(
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

  @override
  List<Object?> get props => [id, subject, description, customer, email, brand, priority, status, tags, createdAt];

  @override
  String toString() {
    return 'TicketItemEntity{id: \$id, subject: \$subject, description: \$description, customer: \$customer, email: \$email, brand: \$brand, priority: \$priority, status: \$status, tags: \$tags, createdAt: \$createdAt}';
  }
}