import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'filter_model.dart';

class FilterItemModel extends Equatable {
  final FilterModel ? brands;
  final FilterModel ? priority;
  final FilterModel ? status;
  final FilterModel ? tags;
  const FilterItemModel({
    this.brands,
    this.priority,
    this.status,
    this.tags,
  });

  FilterItemModel copyWith({
    FilterModel ? brands,
    FilterModel ? priority,
    FilterModel ? status,
    FilterModel ? tags,
  }) {
    return FilterItemModel(
      brands: brands ?? this.brands,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brands': brands?.toMap(),
      'priority': priority?.toMap(),
      'status': status?.toMap(),
      'tags': tags?.toMap(),
    };
  }

  factory FilterItemModel.fromMap(Map<String, dynamic> map) {
    return FilterItemModel(
      brands: map['brands'] != null ? FilterModel .fromMap(map['brands'] as Map<String,dynamic>) : null,
      priority: map['priority'] != null ? FilterModel .fromMap(map['priority'] as Map<String,dynamic>) : null,
      status: map['status'] != null ? FilterModel .fromMap(map['status'] as Map<String,dynamic>) : null,
      tags: map['tags'] != null ? FilterModel .fromMap(map['tags'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterItemModel.fromJson(String source) => FilterItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [brands, priority, status, tags];
}
