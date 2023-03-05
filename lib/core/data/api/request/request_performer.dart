import 'package:dio/dio.dart';
import 'package:pokedex/core/constant.dart';
import 'package:pokedex/core/data/api/endpoints.dart';
import 'package:pokedex/core/data/api/request/index.dart';
import 'package:pokedex/core/utilities/colored_debug_printer.dart';

part 'request_interceptor.dart';

class RequestPerformer extends _DioRequestInterceptor {
  Future<T?> performSerializableRequest<T extends Serializable>({
    required T decodableModel,
    required RestfullMethods method,
    required String path,
    final dynamic data,
    final String? contentType,
    final StringKeyedMap? extraHeaders,
    final StringKeyedMap? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) {
    //* SERIALIZATION
    T? _decode(Response<dynamic> response, T? responseModel) {
      try {
        if (response.data is List || response.data is StringKeyedMap) {
          return responseModel?.fromJson(response.data) as T?;
        } else if (responseModel is NoDataModel) {
          return responseModel.fromJson({'success': response.statusCode == 200}) as T?;
        } else {
          Print.red(
            'Exception',
            '\n[RequestPerformer] Excpetion => `response.data` is neither a List nor a Map',
          );
          return null;
        }
      } catch (error, stackTrace) {
        Print.red(
          'Exception',
          '\n[RequestPerformer] Excpetion => ${error.toString()}\n$stackTrace',
        );

        return null;
      }
    }

    switch (method) {
      case RestfullMethods.get:
        return dio
            .get(
              path,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
            )
            .then((result) => _decode(result, decodableModel));

      case RestfullMethods.post:
        return dio
            .post(
              path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress,
            )
            .then((result) => _decode(result, decodableModel));

      case RestfullMethods.put:
        return dio
            .put(
              path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress,
            )
            .then((result) => _decode(result, decodableModel));

      case RestfullMethods.patch:
        return dio
            .patch(
              path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress,
            )
            .then((result) => _decode(result, decodableModel));

      case RestfullMethods.delete:
        return dio
            .delete(
              path,
              data: data,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
            )
            .then((result) => _decode(result, decodableModel));
    }
  }
}
