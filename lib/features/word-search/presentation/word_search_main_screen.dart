import 'package:flutter/material.dart';
import 'package:natakapp/config/theme/sizes.dart';
import 'package:natakapp/features/word-search/presentation/widgets/word_list.dart';
import 'package:natakapp/features/word-search/presentation/widgets/word_search.dart';
import 'package:natakapp/features/word-search/presentation/widgets/word_search_levels.dart';

class WordSearchMainScreen extends StatelessWidget {
  const WordSearchMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: kSpacer),
          WordSearchLevels(),
          SizedBox(height: kSpacer),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [WordSearch(), SizedBox(width: 20), WordList()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
