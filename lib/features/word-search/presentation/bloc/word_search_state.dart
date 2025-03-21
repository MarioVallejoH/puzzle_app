part of 'word_search_bloc.dart';

@immutable
sealed class WordSearchState {
  final WordSearchModel? wordSearch;
  final List<int> userSelection;
  final List<String> foundWords;

  const WordSearchState({
    this.wordSearch,
    this.userSelection = const [],
    this.foundWords = const [],
  });
}

final class WordSearchInitial extends WordSearchState {
  const WordSearchInitial() : super();
}

final class WordSearchLoad extends WordSearchState {
  const WordSearchLoad({required super.wordSearch}) : super();
}

final class WordSearchFind extends WordSearchState {
  const WordSearchFind({required super.wordSearch, required super.foundWords})
    : super();
}
