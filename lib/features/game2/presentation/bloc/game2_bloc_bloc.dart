import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:natakapp/features/game2/domain/models/question.dart';
import 'package:natakapp/features/game2/infraestructure/repositories/questions_repository.dart';

part 'game2_bloc_event.dart';
part 'game2_bloc_state.dart';

class Game2BlocBloc extends Bloc<Game2BlocEvent, Game2BlocState> {
  Game2BlocBloc() : super(Game2BlocInitial()) {
    on<Game2BlocEventLoad>((event, emit) async {
      final QuestionsRepository questionsRepository = QuestionsRepository();
      emit(
        Game2BlocLoadQuestions(
          questions: await questionsRepository.getQuestions(size: event.level),
        ),
      );
    });
    on<Game2BlocEventUserSelection>((event, emit) async {
      final Map<int, int> temp = Map.from(event.selectedAnswers);
      temp[event.questionIndex] = event.selectedAnswerId;
      emit(
        Game2BlocUserSelection(questions: event.questions, userSelection: temp),
      );
    });
  }
}
