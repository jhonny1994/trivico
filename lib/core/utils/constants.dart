import 'package:flutter/material.dart';

const baseUrl = 'https://opentdb.com/';

const timerSeconds = 15;

const kDefaultPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 8,
);

enum TriviaDifficulty {
  easy,
  medium,
  hard,
}
