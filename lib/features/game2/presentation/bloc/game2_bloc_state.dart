part of 'game2_bloc_bloc.dart';

@immutable
sealed class Game2BlocState {
  final List<Question> questions;
  final Map<int, int> userSelection;
  const Game2BlocState({
    this.questions = const [],
    this.userSelection = const {},
  });
}

final class Game2BlocInitial extends Game2BlocState {
  const Game2BlocInitial() : super();
}

final class Game2BlocLoadQuestions extends Game2BlocState {
  const Game2BlocLoadQuestions({required super.questions});
}

final class Game2BlocUserSelection extends Game2BlocState {
  const Game2BlocUserSelection({
    required super.questions,
    required super.userSelection,
  });
}
