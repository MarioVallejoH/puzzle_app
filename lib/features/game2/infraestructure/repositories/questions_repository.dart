import 'package:natakapp/features/game2/domain/models/question.dart';
import 'package:natakapp/features/game2/domain/repositories/questions_repository.dart';
import 'package:natakapp/features/game2/infraestructure/data_source/local_data_source.dart';

class QuestionsRepository implements IQuestionsRepository {
  @override
  Future<List<Question>> getQuestions({int size = 10}) {
    return Future.value(LocalDataSource.getData(size));
  }
}
