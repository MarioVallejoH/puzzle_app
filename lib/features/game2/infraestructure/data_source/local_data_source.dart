import 'package:collection/collection.dart';
import 'package:natakapp/features/game2/domain/models/question.dart';

class LocalDataSource {
  static final List<Map<String, dynamic>> questions = [
    {
      "question": "¿Cuántas veces al día se recomienda cepillarse los dientes?",
      "right_answer_id": 1,
      "answers": [
        {"answer": "Una vez", "id": 0},
        {"answer": "Dos veces", "id": 1},
        {"answer": "Tres veces", "id": 2},
        {"answer": "Cuatro veces", "id": 3},
      ],
    },
    {
      "question": "¿Qué debemos hacer antes de comer?",
      "right_answer_id": 2,
      "answers": [
        {"answer": "Correr", "id": 0},
        {"answer": "Dormir", "id": 1},
        {"answer": "Lavarnos las manos", "id": 2},
        {"answer": "Jugar", "id": 3},
      ],
    },
    {
      "question": "¿Qué es importante usar para protegernos del sol?",
      "right_answer_id": 0,
      "answers": [
        {"answer": "Bloqueador solar", "id": 0},
        {"answer": "Sombrero", "id": 1},
        {"answer": "Abrigo", "id": 2},
        {"answer": "Guantes", "id": 3},
      ],
    },
    {
      "question": "¿Qué debemos hacer si estamos resfriados?",
      "right_answer_id": 3,
      "answers": [
        {"answer": "Salir a jugar", "id": 0},
        {"answer": "No tomar agua", "id": 1},
        {"answer": "Comer dulces", "id": 2},
        {"answer": "Descansar y tomar líquidos", "id": 3},
      ],
    },
    {
      "question": "¿Qué debemos hacer después de ir al baño?",
      "right_answer_id": 1,
      "answers": [
        {"answer": "Cepillarnos los dientes", "id": 0},
        {"answer": "Lavarnos las manos", "id": 1},
        {"answer": "Peinarnos", "id": 2},
        {"answer": "Tomar agua", "id": 3},
      ],
    },
    {
      "question": "¿Qué debemos hacer si nos cortamos?",
      "right_answer_id": 2,
      "answers": [
        {"answer": "Ignorarlo", "id": 0},
        {"answer": "Cubrirlo con ropa", "id": 1},
        {"answer": "Lavar la herida y cubrirla", "id": 2},
        {"answer": "No hacer nada", "id": 3},
      ],
    },
    {
      "question": "¿Qué debemos comer para tener huesos fuertes?",
      "right_answer_id": 0,
      "answers": [
        {"answer": "Leche y queso", "id": 0},
        {"answer": "Dulces", "id": 1},
        {"answer": "Refrescos", "id": 2},
        {"answer": "Papas fritas", "id": 3},
      ],
    },
    {
      "question": "¿Qué debemos hacer para mantenernos activos y saludables?",
      "right_answer_id": 3,
      "answers": [
        {"answer": "Ver televisión todo el día", "id": 0},
        {"answer": "Comer muchos dulces", "id": 1},
        {"answer": "Dormir todo el día", "id": 2},
        {"answer": "Hacer ejercicio", "id": 3},
      ],
    },
    {
      "question": "¿Qué debemos hacer si tenemos fiebre?",
      "right_answer_id": 1,
      "answers": [
        {"answer": "Salir a jugar", "id": 0},
        {"answer": "Consultar al médico", "id": 1},
        {"answer": "Comer helado", "id": 2},
        {"answer": "No hacer nada", "id": 3},
      ],
    },
    {
      "question": "¿Qué debemos hacer para cuidar nuestros ojos?",
      "right_answer_id": 2,
      "answers": [
        {"answer": "Ver televisión muy cerca", "id": 0},
        {"answer": "Leer con poca luz", "id": 1},
        {
          "answer": "Descansar la vista y no usar pantallas mucho tiempo",
          "id": 2,
        },
        {"answer": "No dormir", "id": 3},
      ],
    },
  ];

  static List<Question> getData(int size) {
    List<Question> questions = Question.fromJsonList(
      LocalDataSource.questions.sample(size),
    );

    return questions;
  }
}
