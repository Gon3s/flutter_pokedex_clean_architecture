import 'package:equatable/equatable.dart';

abstract class _Decodable<T> extends Equatable {
  /// You should implement this method in order to make the model useable by `performSerializableRequest` method
  T fromJson(dynamic json);
}

mixin _Mockable {
  /// Provide data to be mocked if you want, an exception is thrown if mocking data is neither a Map nor a List
  final dynamic mockingData = {};
}

abstract class _Serializable extends _Decodable with _Mockable {}

/// Grants implementing `fromJson(dynamic json)` to make the conforming Model Class
/// usable as the decodable generic parameter of method `performSerializableRequest`
/// Provides optional mockingData attribute to set the data to use when mocking
typedef Serializable = _Serializable;
