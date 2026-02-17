
import '../../../domain/entities/ticket/ticket_item_entity.dart';
import '../../models/ticket/ticket_item_model.dart';

/// Mappers for TICKETITEM
extension TicketItemModelMapper on TicketItemModel {
  /// Converts data model to domain entity
  TicketItemEntity toDomain() {
    return TicketItemEntity(
      id: id,
      subject: subject,
      description: description,
      customer: customer,
      email: email,
      brand: brand,
      priority: priority,
      status: status,
      tags: tags,
      createdAt: createdAt,
    );
  }
}

extension TicketItemEntityMapper on TicketItemEntity {
  /// Converts domain entity to data model
  TicketItemModel toData() {
    return TicketItemModel(
      id: id,
      subject: subject,
      description: description,
      customer: customer,
      email: email,
      brand: brand,
      priority: priority,
      status: status,
      tags: tags,
      createdAt: createdAt,
    );
  }
}