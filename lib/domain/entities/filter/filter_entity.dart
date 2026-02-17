import 'package:equatable/equatable.dart';

/// Domain Entity for FILTER
/// 
/// This represents the core business object in the domain layer.
class FilterEntity extends Equatable {
  final String id;
  final String type;
  final String label;
  final List<Map<String, dynamic>?>? options;

  const FilterEntity({
    required this.id,
    required this.type,
    required this.label,
    required this.options,
  });

  FilterEntity copyWith({
    String? id,
    String? type,
    String? label,
    List<Map<String, dynamic>?>? options,
  }) {
    return FilterEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      label: label ?? this.label,
      options: options ?? this.options,
    );
  }

  @override
  List<Object?> get props => [id, type, label, options];

  @override
  String toString() {
    return 'FilterEntity{id: \$id, type: \$type, label: \$label, options: \$options}';
  }
}