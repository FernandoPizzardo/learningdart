import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningdart/core/usecases/usecase.dart';
import 'package:learningdart/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:learningdart/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:learningdart/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:learningdart/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() async {
  const String description = "Deve pegar a trivia randomica do repositório";
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });
  final tNumberTrivia = NumberTrivia(text: "text", number: 1);

  test(
    description,
    () async {
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase(NoParams());
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
