import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/src/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_list/domain/usecases/get_pokemon_list.dart';

import 'get_pokemon_list_test.mocks.dart';

class GetPokemonListTest extends Mock implements GetPokemonList {}

@GenerateMocks([GetPokemonListTest])
void main() {
  late MockGetPokemonListTest mockGetPokemonListTest;

  setUp(() {
    mockGetPokemonListTest = MockGetPokemonListTest();
  });

  group('getPokemonList', () {
    test('should return a list of PokemonEntity', () async {
      // arrange
      when(mockGetPokemonListTest.execute()).thenAnswer((_) async => []);
      // act
      final result = await mockGetPokemonListTest.execute();
      // assert
      expect(result, isA<List<PokemonEntity>>());
    });

    test('should return null if the call to the remote data source is unsuccessful', () async {
      // arrange
      when(mockGetPokemonListTest.execute()).thenAnswer((_) async => null);
      // act
      final result = await mockGetPokemonListTest.execute();
      // assert
      expect(result, null);
    });
  });
}
