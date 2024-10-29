import 'package:freezed_annotation/freezed_annotation.dart';
part 'signin_state.freezed.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState.initial() = _Initial;
  const factory SigninState.loading() = Loading;
  const factory SigninState.emailSuccess() = EmailSuccess;
  const factory SigninState.emailError(String errMsg) = EmailError;
  const factory SigninState.googleSuccess() = GoogleSuccess;
  const factory SigninState.googleError() = GoogleError;
  const factory SigninState.googleNotRegistered() = GoogleNotRegistered;
}
