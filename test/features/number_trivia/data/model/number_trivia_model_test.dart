import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:learningdart/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:learningdart/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(
    number: 1910,
    text: "1910 é Corinthians. Vai Corinthians",
  );

  String description = "Tem que ser uma subclasse da entidade NumberTrivia ";
  test(
    description,
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group('fromJson', () {
    description = "Validando o Int que volta";
    test(description, () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      print(jsonMap);

      final result = NumberTriviaModel.fromJson(jsonMap);

      print(result);

      expect(result, tNumberTriviaModel);
    });
    description = "Volta Double";
    test(description, () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));

      print(jsonMap);

      final result = NumberTriviaModel.fromJson(jsonMap);

      print(result);

      expect(result, tNumberTriviaModel);
    });
  });

  group('fromJson', () {
    test(description, () async {
      final result = tNumberTriviaModel.toJson();

      final expectedMap = {
        "text": "1910 é Corinthians. Vai Corinthians",
        "number": 1910,
      };
      expect(result, expectedMap);
    });
  });
}
