import 'dart:convert';

import 'package:natakapp/features/game2/domain/models/answer.dart';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  String question;
  int rightAnswerId;
  List<Answer> answers;

  Question({
    required this.question,
    required this.rightAnswerId,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    rightAnswerId: json["right_answer_id"],
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "right_answer_id": rightAnswerId,
    "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
  };

  static List<Question> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Question.fromJson(json)).toList();
  }
}
