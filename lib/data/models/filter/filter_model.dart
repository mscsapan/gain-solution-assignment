// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FilterModel extends Equatable {
  final String? id;
  final String? type;
  final String? label;
  final List<Map<String, dynamic>?>? options;
  const FilterModel({this.id, this.type, this.label, this.options});

  FilterModel copyWith({
    String? id,
    String? type,
    String? label,
    List<Map<String, dynamic>?>? options,
  }) {
    return FilterModel(
      id: id ?? this.id,
      type: type ?? this.type,
      label: label ?? this.label,
      options: options ?? this.options,
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
      id: map['id'] != null ? map['id'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      label: map['label'] != null ? map['label'] as String : null,
      options: map['options'] != null
          ? List<Map<String, dynamic>?>.from(
              (map['options'] as List<int>).map<Map<String, dynamic?>?>(
                (x) => x,
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterModel.fromJson(String source) =>
      FilterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, type, label, options];
}
