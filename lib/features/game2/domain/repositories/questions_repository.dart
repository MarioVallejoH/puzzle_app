import 'package:natakapp/features/game2/domain/models/question.dart';

abstract class IQuestionsRepository {
  Future<List<Question>> getQuestions({int size = 10});
}
