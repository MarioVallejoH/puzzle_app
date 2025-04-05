part of 'game2_bloc_bloc.dart';

@immutable
sealed class Game2BlocEvent {}

class Game2BlocEventLoad extends Game2BlocEvent {
  final int level;

  Game2BlocEventLoad({required this.level});
}

class Game2BlocEventUserSelection extends Game2BlocEvent {
  final int questionIndex;
  final int selectedAnswerId;
  final List<Question> questions;
  final Map<int, int> selectedAnswers;

  Game2BlocEventUserSelection({
    required this.questionIndex,
    required this.selectedAnswerId,
    required this.questions,
    required this.selectedAnswers,
  });
}
