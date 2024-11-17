import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponse<T> {
  APIResponse({
    T? data,
    int? code,
    String? message,
  }) {
    _data = data;
    _code = code;
    _message = message;
  }

  factory APIResponse.fromJson(
      dynamic json, T Function(Object? json) fromJsonT) {
    if (T is List) {
      return APIResponse<T>(
        data: _fromJsonList(json['data'], fromJsonT),
        code: json['code'] as int?,
        message: json['message'] as String?,
      );
    } else {
      return APIResponse<T>(
        data: json['data'] != null
            ? fromJsonT(json['data'])
            : json['content'] != null
            ? fromJsonT(json['content'])
            : null,
        code: json['code'] as int?,
        message: json['message'] as String?,
      );
    }
  }

  T? _data;
  T? _unavailable;
  int? _code;
  String? _message;

  T? get data => _data;
  T? get unavailable => _unavailable;
  int? get code => _code;
  bool get isSuccess => _code == 1;
  String? get message => _message;

  static T _fromJsonList<T>(
      List<dynamic>? json, T Function(Object? json) fromJsonT) {
    if (json == null) return [] as T;
    return json.map((e) => fromJsonT(e)).toList() as T;
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    final dynamic data = <String, dynamic>{
      'code': code,
      'message': message,
    };

    if (_data != null) {
      data['data'] = toJsonT(_data!);
    }

    if (_unavailable != null) {
      data['unavailables'] = toJsonT(_unavailable!);
    }

    return data;
  }

}
