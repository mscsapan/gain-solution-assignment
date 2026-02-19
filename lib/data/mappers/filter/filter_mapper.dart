import '../../../domain/entities/filter/filter_entity.dart';
import '../../models/filter/filter_model.dart';

/// Mappers for FILTER
extension FilterModelMapper on FilterModel {
  /// Converts data model to domain entity
  FilterEntity toDomain() {
    return FilterEntity(
      id: id,
      type: type,
      label: label,
      options: options,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }
}

extension FilterEntityMapper on FilterEntity {
  /// Converts domain entity to data model
  FilterModel toData() {
    return FilterModel(
      id: id,
      type: type,
      label: label,
      options: options,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }
}