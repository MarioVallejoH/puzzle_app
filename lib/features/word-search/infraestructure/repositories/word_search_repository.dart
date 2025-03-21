import 'package:natakapp/features/word-search/domain/repositories/word_search_repository.dart';
import 'package:natakapp/features/word-search/infraestructure/data_source/local_data_source.dart';

class WordSearchRepository implements IWordSearchRepository {
  @override
  Future<List<String>> getWords(int size, int maxSize) async {
    return Future.value(LocalDataSource.getWords(size, maxSize));
  }
}
