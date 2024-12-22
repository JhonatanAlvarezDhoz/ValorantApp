import 'package:valoratapp/core/exceptions/exceptions.dart';

// Definition of generic result
class Result<T> {
  final T? data;
  final AppException? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}
