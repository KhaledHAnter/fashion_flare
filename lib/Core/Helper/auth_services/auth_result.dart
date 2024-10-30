import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_result.freezed.dart';

@Freezed()
abstract class AuthResult<T> with _$AuthResult<T> {
  const factory AuthResult.success(T data) = Success<T>;
  const factory AuthResult.error(String errMessage) = Error<T>;
}
