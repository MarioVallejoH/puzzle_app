part of 'word_search_bloc.dart';

@immutable
sealed class WordSearchEvent {}

class GetWordSearchEvent extends WordSearchEvent {
  final int size;

  GetWordSearchEvent(this.size);
}

class WordSearchFindEvent extends WordSearchEvent {
  final String word;

  WordSearchFindEvent(this.word);
}
