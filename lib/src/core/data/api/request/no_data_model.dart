import 'serializable_protocol.dart';

class NoDataModel extends Serializable {
  final bool? success;

  NoDataModel({this.success});

  @override
  NoDataModel fromJson(json) => NoDataModel(success: json['success'] as bool);

  @override
  List<Object?> get props => [success];
}
