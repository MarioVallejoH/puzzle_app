import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:natakapp/features/word-search/domain/models/word_search_model.dart';
import 'package:natakapp/features/word-search/infraestructure/services/word_search_service.dart';

part 'word_search_event.dart';
part 'word_search_state.dart';

class WordSearchBloc extends Bloc<WordSearchEvent, WordSearchState> {
  WordSearchBloc() : super(WordSearchInitial()) {
    on<GetWordSearchEvent>((event, emit) async {
      emit(
        WordSearchLoad(
          wordSearch: await WordSearchService().getWordSearch(event.size),
        ),
      );
    });
    on<WordSearchFindEvent>((event, emit) async {
      emit(
        WordSearchFind(
          wordSearch: state.wordSearch,
          foundWords: [...state.foundWords, event.word],
        ),
      );
    });
  }
}
