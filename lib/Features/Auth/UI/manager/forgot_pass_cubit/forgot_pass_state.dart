import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgot_pass_state.freezed.dart';

@freezed
class ForgotPassState with _$ForgotPassState {
  const factory ForgotPassState.initial() = _Initial;
  const factory ForgotPassState.loading() = Loading;
  const factory ForgotPassState.sentSuccess() = SentSuccess;
  const factory ForgotPassState.sentError(String errMsg) = SentError;
}
