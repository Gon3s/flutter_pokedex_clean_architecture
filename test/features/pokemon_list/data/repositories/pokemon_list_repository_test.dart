import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';

import 'pokemon_list_repository_test.mocks.dart';

class PokemonListRepositoryTest extends Mock implements PokemonListRepository {}

@GenerateMocks([PokemonListRepositoryTest])
Future<void> main() async {
  late MockPokemonListRepositoryTest mockPokemonListRepositoryTest;

  setUp(() {
    mockPokemonListRepositoryTest = MockPokemonListRepositoryTest();
  });

  group('getPokemonList', () {
    test('should return a list of PokemonEntity', () async {
      // arrange
      when(mockPokemonListRepositoryTest.getPokemonList()).thenAnswer((_) async => []);
      // act
      final result = await mockPokemonListRepositoryTest.getPokemonList();
      // assert
      expect(result, isA<List<PokemonEntity>>());
    });

    test('should return null if the call to the remote data source is unsuccessful', () async {
      // arrange
      when(mockPokemonListRepositoryTest.getPokemonList()).thenAnswer((_) async => null);
      // act
      final result = await mockPokemonListRepositoryTest.getPokemonList();
      // assert
      expect(result, null);
    });
  });
}
