import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

//* Request Methods
enum RestfullMethods { get, post, put, delete, patch }

//* TypeDefs
typedef FutureRequestResult<T> = Future<Either<DioError, T?>>;
typedef StringKeyedMap = Map<String, dynamic>;
