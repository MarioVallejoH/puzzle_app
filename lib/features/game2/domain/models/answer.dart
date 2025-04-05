class Answer {
  String answer;
  int id;

  Answer({required this.answer, required this.id});

  factory Answer.fromJson(Map<String, dynamic> json) =>
      Answer(answer: json["answer"], id: json["id"]);

  Map<String, dynamic> toJson() => {"answer": answer, "id": id};
}
