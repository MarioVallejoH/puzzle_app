import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natakapp/features/word-search/config/theme/colors.dart';
import 'package:natakapp/features/word-search/config/theme/sizes.dart';
import 'package:natakapp/features/word-search/presentation/bloc/word_search_bloc.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordSearchBloc, WordSearchState>(
      builder: (context, state) {
        if (state is WordSearchLoad || state is WordSearchFind) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.kTertiaryColor,
              borderRadius: BorderRadius.circular(kBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(kPadding),
            child: Column(
              children: [
                Text(
                  'Palabras a encontrar:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: kSpacer),
                  padding: EdgeInsets.all(kPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  width: 300,
                  height: (state.wordSearch?.words.length ?? 1) * 38,
                  child: ListView.builder(
                    itemCount: state.wordSearch?.words.length,
                    itemBuilder: (context, index) {
                      final word = state.wordSearch?.words[index];
                      final isFound = state.foundWords.contains(word);
                      final textDecoration =
                          isFound
                              ? TextDecoration.lineThrough
                              : TextDecoration.none;
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: WordSearchColors.kWordSearchCellBorder,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          (word ?? ''),
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            decoration: textDecoration,
                            shadows:
                                isFound
                                    ? [
                                      Shadow(
                                        color: Theme.of(context).primaryColor,
                                        blurRadius: 10,
                                      ),
                                    ]
                                    : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is WordSearchLoad) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text('Selecciona un nivel para iniciar.'));
        }
      },
    );
  }
}
