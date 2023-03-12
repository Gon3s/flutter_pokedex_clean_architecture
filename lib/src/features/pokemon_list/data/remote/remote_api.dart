import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/src/core/data/api/endpoints.dart';
import 'package:pokedex/src/core/data/api/request/index.dart';
import 'package:pokedex/src/features/pokemon_list/data/models/pokemon_list_model.dart';

import '../models/pokemon_details_model.dart';

class RemoteApi extends RequestPerformer {
  Future<Either<DioError, PokemonListModel>> getPokemonList({
    int limit = 20,
    int page = 0,
  }) async {
    try {
      return Right(
        (await performSerializableRequest(
          decodableModel: PokemonListModel(),
          method: RestfullMethods.get,
          path: Endpoints.pokemonListPath,
          queryParameters: {
            'limit': limit,
            'offset': (page - 1) * limit,
          },
        )) as PokemonListModel,
      );
    } on DioError catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioError, PokemonDetailsModel>> getPokemonDetails({required int id}) async {
    try {
      return Right(
        (await performSerializableRequest(
          decodableModel: PokemonDetailsModel(),
          method: RestfullMethods.get,
          path: Endpoints.pokemonDetailsPath.replaceAll('{id}', '$id'),
        )) as PokemonDetailsModel,
      );
    } on DioError catch (e) {
      return Left(e);
    }
  }
}
