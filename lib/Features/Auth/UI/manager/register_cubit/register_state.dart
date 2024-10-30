import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.emailSuccess() = EmailSuccess;
  const factory RegisterState.emailError(String errMsg) = EmailError;
  const factory RegisterState.googleSuccess() = GoogleSuccess;
  const factory RegisterState.googleError() = GoogleError;
  const factory RegisterState.googleNotRegistered() = GoogleNotRegistered;
}
