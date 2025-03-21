abstract class IWordSearchRepository {
  Future<List<String>> getWords(int size, int maxSize);
}
