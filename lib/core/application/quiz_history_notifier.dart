import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivico/core/domain/quiz/quiz_history.dart';

part 'quiz_history_notifier.g.dart';

/// Key used to store quiz history in SharedPreferences
const _kQuizHistoryKey = 'quiz_history';

/// Maximum number of quiz history entries to store
const _maxHistoryEntries = 50;

/// Notifier that manages the quiz history state
@riverpod
class QuizHistoryNotifier extends _$QuizHistoryNotifier {
  @override
  Future<List<QuizHistory>> build(SharedPreferences prefs) async {
    return _loadHistory();
  }

  /// Loads quiz history from SharedPreferences
  Future<List<QuizHistory>> _loadHistory() async {
    try {
      final historyJson = prefs.getStringList(_kQuizHistoryKey);
      if (historyJson == null) {
        return [];
      }

      return historyJson
          .map(
            (json) =>
                QuizHistory.fromJson(jsonDecode(json) as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Adds a new quiz history entry
  Future<void> addQuizHistory(QuizHistory history) async {
    try {
      state = const AsyncLoading();
      final currentHistory = await _loadHistory();
      final updatedHistory = [history, ...currentHistory];

      if (updatedHistory.length > _maxHistoryEntries) {
        updatedHistory.removeLast();
      }

      final historyJson = updatedHistory
          .map((history) => jsonEncode(history.toJson()))
          .toList();

      await prefs.setStringList(_kQuizHistoryKey, historyJson);
      state = AsyncData(updatedHistory);
    } catch (e, stack) {
      state = AsyncError(e, stack);
      rethrow;
    }
  }

  /// Clears all quiz history
  Future<void> clearHistory() async {
    try {
      state = const AsyncLoading();
      await prefs.remove(_kQuizHistoryKey);
      state = const AsyncData([]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
      rethrow;
    }
  }
}
