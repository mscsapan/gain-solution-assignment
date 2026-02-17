import '../../../domain/entities/contact/contact_item_entity.dart';
import '../../models/contact/contact_item_model.dart';

/// Mappers for CONTACTITEM
extension ContactItemModelMapper on ContactItemModel {
  /// Converts data model to domain entity
  ContactItemEntity toDomain() {
    return ContactItemEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      designation: designation,
      address: address,
      image: image,
    );
  }
}

extension ContactItemEntityMapper on ContactItemEntity {
  /// Converts domain entity to data model
  ContactItemModel toData() {
    return ContactItemModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      designation: designation,
      address: address,
      image: image,
    );
  }
}