import 'dart:math';

import 'package:flutter/material.dart';
import 'package:natakapp/features/word-search/domain/models/word_search_model.dart';
import 'package:natakapp/features/word-search/infraestructure/repositories/word_search_repository.dart';

class WordSearchService {
  Future<WordSearchModel> getWordSearch(int size) async {
    List<String> words = await WordSearchRepository().getWords(
      (size / (1.5)).toInt(),
      size,
    );
    List<List<String>> wordSearch = List.generate(
      size,
      (_) => List.filled(size, '', growable: false),
    );
    Map<String, List<Offset>> wordPositions = {};
    Random random = Random();

    for (String word in words) {
      bool placed = false;
      bool reverse =
          random.nextBool(); // Determina si la palabra debe ser invertida
      String wordToPlace = reverse ? word.split('').reversed.join('') : word;

      while (!placed) {
        int direction = random.nextInt(
          3,
        ); // 0: horizontal, 1: vertical, 2: diagonal
        int row = random.nextInt(size);
        int col = random.nextInt(size);

        if (direction == 0 && col + wordToPlace.length <= size) {
          // Horizontal
          if (_canPlaceWord(wordSearch, wordToPlace, row, col, 0, 1)) {
            _placeWord(
              wordSearch,
              wordToPlace,
              word,
              row,
              col,
              0,
              1,
              wordPositions,
            );
            placed = true;
          }
        } else if (direction == 1 && row + wordToPlace.length <= size) {
          // Vertical
          if (_canPlaceWord(wordSearch, wordToPlace, row, col, 1, 0)) {
            _placeWord(
              wordSearch,
              wordToPlace,
              word,
              row,
              col,
              1,
              0,
              wordPositions,
            );
            placed = true;
          }
        } else if (direction == 2 &&
            row + wordToPlace.length <= size &&
            col + wordToPlace.length <= size) {
          // Diagonal
          if (_canPlaceWord(wordSearch, wordToPlace, row, col, 1, 1)) {
            _placeWord(
              wordSearch,
              wordToPlace,
              word,
              row,
              col,
              1,
              1,
              wordPositions,
            );
            placed = true;
          }
        }
      }
    }

    // Fill empty spaces with random letters
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (wordSearch[i][j] == '') {
          wordSearch[i][j] = String.fromCharCode(
            random.nextInt(26) + 65,
          ); // A-Z
        }
      }
    }

    return Future.value(
      WordSearchModel(
        data: wordSearch,
        words: words,
        wordPositions: wordPositions,
      ),
    );
  }

  bool _canPlaceWord(
    List<List<String>> grid,
    String word,
    int row,
    int col,
    int rowDir,
    int colDir,
  ) {
    for (int i = 0; i < word.length; i++) {
      if (grid[row + i * rowDir][col + i * colDir] != '') {
        return false;
      }
    }
    return true;
  }

  void _placeWord(
    List<List<String>> grid,
    String word,
    String wordOriginal,
    int row,
    int col,
    int rowDir,
    int colDir,
    Map<String, List<Offset>> wordPositions,
  ) {
    List<Offset> positions = [];
    for (int i = 0; i < word.length; i++) {
      grid[row + i * rowDir][col + i * colDir] = word[i];
      positions.add(
        Offset(row + i * rowDir.toDouble(), col + i * colDir.toDouble()),
      );
    }
    wordPositions[wordOriginal] = positions;
  }
}
