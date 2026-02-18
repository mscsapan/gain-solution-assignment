import 'package:equatable/equatable.dart';

import 'filter_entity.dart';

/// Domain Entity for FILTERITEM
/// 
/// This represents the core business object in the domain layer.
class FilterItemEntity extends Equatable {
  final FilterEntity ? brands;
  final FilterEntity ? priority;
  final FilterEntity ? status;
  final FilterEntity ? tags;

  const FilterItemEntity({
    required this.brands,
    required this.priority,
    required this.status,
    required this.tags,
  });

  FilterItemEntity copyWith({
    FilterEntity ? brands,
    FilterEntity ? priority,
    FilterEntity ? status,
    FilterEntity ? tags,
  }) {
    return FilterItemEntity(
      brands: brands ?? this.brands,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      tags: tags ?? this.tags,
    );
  }

  @override
  List<Object?> get props => [brands, priority, status, tags];

  @override
  String toString() {
    return 'FilterItemEntity{brands: \$brands, priority: \$priority, status: \$status, tags: \$tags}';
  }
}