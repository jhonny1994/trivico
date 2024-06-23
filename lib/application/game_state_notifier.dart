import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/domain/game_state.dart';

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier()
      : super(
          const GameState.initial(),
        );
}
