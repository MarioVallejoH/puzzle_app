import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natakapp/features/game2/presentation/bloc/game2_bloc_bloc.dart';
import 'package:natakapp/features/game2/presentation/widgets/question.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int?> selectedAnswerId = ValueNotifier(null);
    return SizedBox(
      child: BlocBuilder<Game2BlocBloc, Game2BlocState>(
        builder: (context, state) {
          if (state.questions.isEmpty) {
            BlocProvider.of<Game2BlocBloc>(
              context,
            ).add(Game2BlocEventLoad(level: 5));
            return const Center(child: CircularProgressIndicator());
          }
          List<Step> steps = [];
          for (int i = 0; i < state.questions.length; i++) {
            steps.add(
              Step(
                title: SizedBox(),
                content: QuestionWidget(
                  key: UniqueKey(),
                  data: state.questions[i],
                  onAnswerSelected: (int answerId) {
                    selectedAnswerId.value = answerId;
                  },
                ),
                isActive: state.userSelection.length == i,
                state:
                    state.userSelection.length > i
                        ? StepState.complete
                        : StepState.indexed,
              ),
            );
          }
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stepper(
                currentStep: state.userSelection.length,
                physics: BouncingScrollPhysics(),
                type: StepperType.horizontal,
                steps: steps,
                controlsBuilder: (BuildContext context, controlsDetails) {
                  return StepControls(
                    selectedAnswerId: selectedAnswerId,
                    state: state,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class StepControls extends StatelessWidget {
  const StepControls({
    super.key,
    required this.selectedAnswerId,
    required this.state,
  });

  final ValueNotifier<int?> selectedAnswerId;
  final Game2BlocState state;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: selectedAnswerId,
      builder: (context, value, child) {
        selectedAnswerId.value = null;
        return ElevatedButton(
          onPressed:
              value != null
                  ? () {
                    final currentQuestion =
                        state.questions[state.userSelection.length];
                    if (value == currentQuestion.rightAnswerId) {
                      if (state.userSelection.length ==
                          state.questions.length - 1) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('¡Felicidades!'),
                              content: const Text(
                                'Has completado todas las preguntas.',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    selectedAnswerId.value = null;
                                    context.read<Game2BlocBloc>().add(
                                      Game2BlocEventLoad(level: 5),
                                    );
                                  },
                                  child: const Text('Aceptar'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        context.read<Game2BlocBloc>().add(
                          Game2BlocEventUserSelection(
                            selectedAnswerId: value,
                            questionIndex: state.userSelection.length,
                            questions: state.questions,
                            selectedAnswers: state.userSelection,
                          ),
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Respuesta Incorrecta'),
                            content: const Text(
                              'La respuesta seleccionada no es correcta.',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Aceptar'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                value != null ? Theme.of(context).primaryColor : Colors.grey,
          ),
          child: Text(
            'Continuar',
            style: TextStyle(
              color: value != null ? Colors.white : Colors.black,
            ),
          ),
        );
      },
    );
  }
}
