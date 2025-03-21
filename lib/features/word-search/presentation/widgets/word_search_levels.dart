import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natakapp/config/theme/sizes.dart';
import 'package:natakapp/features/word-search/presentation/bloc/word_search_bloc.dart';

class WordSearchLevels extends StatelessWidget {
  const WordSearchLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        FilledButton(
          onPressed: () {
            BlocProvider.of<WordSearchBloc>(
              context,
              listen: false,
            ).add(GetWordSearchEvent(10));
          },
          child: Text('Nivel Fácil'),
        ),
        SizedBox(width: kHSpacer),
        FilledButton(
          onPressed: () {
            BlocProvider.of<WordSearchBloc>(
              context,
              listen: false,
            ).add(GetWordSearchEvent(15));
          },
          child: Text('Nivel Intermedio'),
        ),
        SizedBox(width: kHSpacer),
        FilledButton(
          onPressed: () {
            BlocProvider.of<WordSearchBloc>(
              context,
              listen: false,
            ).add(GetWordSearchEvent(25));
          },
          child: Text('Nivel Difícil'),
        ),
      ],
    );
  }
}
