part of 'request_performer.dart';

class _DioRequestInterceptor extends _RequestDebugger {
  final Dio baseDio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(milliseconds: AppConstant.connectTimeout),
      receiveTimeout: const Duration(milliseconds: AppConstant.receiveTimeout),
      sendTimeout: const Duration(milliseconds: AppConstant.sendTimeout),
    ),
  );

  Dio get dio {
    baseDio.interceptors
      ..clear()
      ..add(
        QueuedInterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
            //Todo: uncomment this line to enable loading indicator
            // Easyloading.show();

            describeRequest(options);
            handler.next(options);
          },
          onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) {
            describeResponse(response);
            restoreRequestConfiguration();

            handler.next(response);
          },
          onError: (DioError error, ErrorInterceptorHandler handler) {
            describeError(error);
            restoreRequestConfiguration();

            handler.next(error);
          },
        ),
      );

    (baseDio.transformer as BackgroundTransformer).jsonDecodeCallback;

    return baseDio;
  }

  void restoreRequestConfiguration() {
    //Todo: uncomment this line to disable loading indicator
    // EasyLoading.dismiss();
    _RequestDebugger.debugginEnabled = true;
  }
}

class _RequestDebugger {
  static bool debugginEnabled = false;

  void describeRequest(final RequestOptions requestOptions) {
    if (!debugginEnabled) return;
    Print.printRequest('___________________________________________________________________________________');

    Print.printRequest('|    ---- Base Url        : ${requestOptions.baseUrl}');
    Print.printRequest('|    ---- Endpoint        : ${requestOptions.path}');
    Print.printRequest('|    ---- headers         : ${requestOptions.headers}');
    Print.printRequest('|    ---- queryParameters : ${requestOptions.queryParameters}');
    Print.printRequest('|    ---- data            : ${requestOptions.data}');
    Print.printRequest('___________________________________________________________________________________');
  }

  void describeResponse(final Response<dynamic> response) {
    if (!debugginEnabled) return;
    Print.printResponse('___________________________________________________________________________________');
    Print.printResponse('|    ---- Status Code:    : ${response.statusCode}');
    Print.printResponse('|    ---- Status Message  : ${response.statusMessage}');
    Print.printResponse('|    ---- Base Url        : ${response.requestOptions.baseUrl}');
    Print.printResponse('|    ---- Endpoint        : ${response.requestOptions.path}');
    Print.printResponse('|    ---- Data            : ${response.data}');
    Print.printResponse('___________________________________________________________________________________');
  }

  void describeError(final DioError error) {
    Print.printFailure('___________________________________________________________________________________');
    Print.printFailure('|    ---- Base Url       : ${error.requestOptions.baseUrl}');
    Print.printFailure('|    ---- Endpoint       : ${error.requestOptions.path}');
    Print.printFailure('|    ---- Error Type     : ${error.type}');
    Print.printFailure('|    ---- Status Message : ${error.response?.statusMessage}');
    Print.printFailure('|    ---- Status code    : ${error.response?.statusCode}');
    Print.printFailure('|    ---- Error message  : ${error.response?.data}');
    Print.printFailure('___________________________________________________________________________________');
  }
}
