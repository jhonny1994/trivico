// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

String nameFromJson(String value) {
  final index = value.indexOf(': ');
  if (index != -1) {
    return value.substring(index + 2);
  } else {
    return value;
  }
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name', fromJson: nameFromJson) required String name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
