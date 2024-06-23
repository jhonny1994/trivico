// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TriviaCategoriesImpl _$$TriviaCategoriesImplFromJson(
        Map<String, dynamic> json) =>
    _$TriviaCategoriesImpl(
      categories: (json['trivia_categories'] as List<dynamic>)
          .map((e) => TriviaCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TriviaCategoriesImplToJson(
        _$TriviaCategoriesImpl instance) =>
    <String, dynamic>{
      'trivia_categories': instance.categories,
    };

_$TriviaCategoryImpl _$$TriviaCategoryImplFromJson(Map<String, dynamic> json) =>
    _$TriviaCategoryImpl(
      id: (json['id'] as num).toInt(),
      name: nameFromJson(json['name'] as String),
    );

Map<String, dynamic> _$$TriviaCategoryImplToJson(
        _$TriviaCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
