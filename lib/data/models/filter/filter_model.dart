// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../presentation/cubit/filter/filter_cubit.dart';

class FilterModel extends Equatable {
  final String id;
  final String type;
  final String label;
  final List<Map<String, dynamic>?>? options;

  final List<String?> ? brands;
  final List<String?> ? tags;
  final List<String?> ? selectedTags;
  final String priority;
  final String status;
  final double minPrice;
  final double maxPrice;

  final FilterModel ? filter;

  final List<String> randomizedTexts;

  final FilterState filterState;

  const FilterModel({
    this.id = '',
    this.type = '',
    this.label = '',
    this.brands = const [],
    this.tags = const [],
    this.randomizedTexts = const [],
    this.selectedTags = const [],
    this.priority = '',
    this.status = '',
    this.minPrice = 0.0,
    this.maxPrice = 0.0,
    this.options = const [],
    this.filter,
    this.filterState = const FilterInitial(),
  });

  FilterModel copyWith({
    String? id,
    String? type,
    String? label,
    List<Map<String, dynamic>?>? options,

    List<String?> ? brands,
    List<String?> ? tags,
    List<String?> ? selectedTags,
    String? priority,
    String? status,
    double? minPrice,
    double? maxPrice,
    FilterModel ? filter,
    List<String>? randomizedTexts,
    FilterState? filterState,
  }) {
    return FilterModel(
      id: id ?? this.id,
      type: type ?? this.type,
      label: label ?? this.label,
      options: options ?? this.options,
      brands: brands ?? this.brands,
      tags: tags ?? this.tags,
      selectedTags: selectedTags ?? this.selectedTags,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      filter: filter ?? this.filter,
      randomizedTexts: randomizedTexts ?? this.randomizedTexts,
      filterState: filterState ?? this.filterState,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'label': label,
      'options': options,
    };
  }

  factory FilterModel.fromMap(Map<String, dynamic> map) {
    return FilterModel(
      id: map['id'] ?? 0,
      type: map['type'] ?? '',
      label: map['label'] ?? '',
      minPrice: map['min_price'] != null? double.parse(map['min_price'].toString()):0.0,
      maxPrice: map['max_price'] != null? double.parse(map['max_price'].toString()):0.0,
      options: map['options'] != null
          ? List<Map<String, dynamic>?>.from(
              (map['options'] as List<dynamic>).map<Map<String, dynamic>?>(
                (x) => x,
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterModel.fromJson(String source) =>
      FilterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
    id,
    type,
    label,
    options,
    filterState,
    brands,
    tags,
    selectedTags,
    priority,
    status,
    minPrice,
    maxPrice,
    randomizedTexts,
    filter,
  ];
}
