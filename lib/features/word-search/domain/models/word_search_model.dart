import 'package:flutter/material.dart';

/// [WordSearchModel] is a  model class used to manage the word sea.
class WordSearchModel {
  List<List<String>> data;
  List<String> words;
  Map<String, List<Offset>> wordPositions;

  WordSearchModel({
    required this.data,
    required this.words,
    required this.wordPositions,
  });
}
