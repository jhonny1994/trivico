// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class TriviaCategories with _$TriviaCategories {
  const factory TriviaCategories({
    @JsonKey(name: 'trivia_categories') required List<TriviaCategory> categories,
  }) = _TriviaCategories;

  factory TriviaCategories.fromJson(Map<String, dynamic> json) => _$TriviaCategoriesFromJson(json);
}

String nameFromJson(String value) {
  final index = value.indexOf(': ');
  if (index != -1) {
    return value.substring(index + 2);
  } else {
    return value;
  }
}

@freezed
class TriviaCategory with _$TriviaCategory {
  const factory TriviaCategory({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name', fromJson: nameFromJson) required String name,
  }) = _TriviaCategory;

  factory TriviaCategory.fromJson(Map<String, dynamic> json) => _$TriviaCategoryFromJson(json);
}

const categoris = {
  'trivia_categories': [
    {'id': 9, 'name': 'General Knowledge'},
    {'id': 10, 'name': 'Entertainment: Books'},
    {'id': 11, 'name': 'Entertainment: Film'},
    {'id': 12, 'name': 'Entertainment: Music'},
    {'id': 13, 'name': 'Entertainment: Musicals & Theatres'},
    {'id': 14, 'name': 'Entertainment: Television'},
    {'id': 15, 'name': 'Entertainment: Video Games'},
    {'id': 16, 'name': 'Entertainment: Board Games'},
    {'id': 17, 'name': 'Science & Nature'},
    {'id': 18, 'name': 'Science: Computers'},
    {'id': 19, 'name': 'Science: Mathematics'},
    {'id': 20, 'name': 'Mythology'},
    {'id': 21, 'name': 'Sports'},
    {'id': 22, 'name': 'Geography'},
    {'id': 23, 'name': 'History'},
    {'id': 24, 'name': 'Politics'},
    {'id': 25, 'name': 'Art'},
    {'id': 26, 'name': 'Celebrities'},
    {'id': 27, 'name': 'Animals'},
    {'id': 28, 'name': 'Vehicles'},
    {'id': 29, 'name': 'Entertainment: Comics'},
    {'id': 30, 'name': 'Science: Gadgets'},
    {'id': 31, 'name': 'Entertainment: Japanese Anime & Manga'},
    {'id': 32, 'name': 'Entertainment: Cartoon & Animations'},
  ],
};
