import 'package:collection/collection.dart';

class LocalDataSource {
  static List<String> getWords(int length, int maxSize) {
    return [
      'CONTAGIO',
      'GRIPE',
      'LAVADODEMANOS',
      'RESFRIADO',
      'VIRUS',
      'ENFERMOS',
      'HIGIENE',
      'TAPABOCAS',
      'CUIDADO',
      'INFECCIÓN',
      'PREVENCIÓN',
      'SALUD',
      'ALÉRGENOS',
      'HIDRATACIÓN',
      'TABACO',
      'VACUNACIÓN',
    ].where((word) => word.length <= maxSize).toList().sample(length);
  }
}
