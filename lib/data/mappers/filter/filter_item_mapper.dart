import '../../../domain/entities/filter/filter_item_entity.dart';
import '../../models/filter/filter_item_model.dart';
import 'filter_mapper.dart';

/// Mappers for FILTERITEM
extension FilterItemModelMapper on FilterItemModel {
  /// Converts data model to domain entity
  FilterItemEntity toDomain() {
    return FilterItemEntity(
      brands: brands?.toDomain(),
      priority: priority?.toDomain(),
      status: status?.toDomain(),
      tags: tags?.toDomain(),
    );
  }
}

extension FilterItemEntityMapper on FilterItemEntity {
  /// Converts domain entity to data model
  FilterItemModel toData() {
    return FilterItemModel(
      brands: brands?.toData(),
      priority: priority?.toData(),
      status: status?.toData(),
      tags: tags?.toData(),
    );
  }
}