part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}
//////////////////////////// login //////////////////////////////////////////////////////////////////
class LogInSuccessState extends AuthState {}

class LogInLoadingState extends AuthState {}

class FailedToLoginState extends AuthState {
  // 3l4an a3rf el error feen
  final String message;
  FailedToLoginState({required this.message});
}

//////////////////////////// Reset With Email/////////////////////////////////////////////////////////

class ResetWithEmailSuccessState extends AuthState {}

class ConfirmatinResetByMailLoadingState extends AuthState {}

class ConfirmatinResetByMailToFailedState extends AuthState {
  // 3l4an a3rf el error feen
  final String ResetPassWithMail;
  ConfirmatinResetByMailToFailedState({required this.ResetPassWithMail});
}


///////////////////////// Active Code With Email /////////////////////////////////////////////////////



class ActiveCodeLoadingStateWithEmail extends AuthState {}

class ActiveCodeSuccessStateEmail extends AuthState {}

class ActiveCodeFailedStateEmail extends AuthState {
  String errorActiveSendCodeWithEmail;

  ActiveCodeFailedStateEmail({required this.errorActiveSendCodeWithEmail});
}



///////////////////////// Resend Code With Email //////////////////////////////////////////////////////

class ResendCodeLoadingStateWithEmail extends AuthState {}

class ResendCodeSuccessStateEmail extends AuthState {}

class ResendCodeFailedStateEmail extends AuthState {
  String errorToSendCodeWithEmail;

  ResendCodeFailedStateEmail({required this.errorToSendCodeWithEmail});
}



////////////////////////// Reset With Phone  /////////////////////////////////////////////////////////

class ResetWithPhoneSuccessState extends AuthState {}

class ConfirmatinResetByPhoneLoadingState extends AuthState {}

class ConfirmatinResetByPhoneToFailedState extends AuthState {
  // 3l4an a3rf el error feen
  final String ResetPassWithPhone;
  ConfirmatinResetByPhoneToFailedState({required this.ResetPassWithPhone});
}

///////////////////////// Change Password ///////////////////////////////////////////////////////////////

class ChangePasswordLoadingState extends AuthState {}

class ChangePasswordSuccessState extends AuthState {}

class ChangePasswordFailedState extends AuthState {
  String error;
  ChangePasswordFailedState(this.error);
}



///////////////////////// Active Code With Phone /////////////////////////////////////////////////////



class ActiveCodeLoadingStateWithPhone extends AuthState {}

class ActiveCodeSuccessStatePhone extends AuthState {}

class ActiveCodeFailedStatePhone extends AuthState {
  String errorActiveSendCodeWithPhone;

  ActiveCodeFailedStatePhone({required this.errorActiveSendCodeWithPhone});
}

///////////////////////// Resend Code With Phone //////////////////////////////////////////////////////

class ResendCodeLoadingStateWithPhone extends AuthState {}

class ResendCodeSuccessStatePhone extends AuthState {}

class ResendCodeFailedStatePhone extends AuthState {
  String errorToSendCodeWithPhone;

  ResendCodeFailedStatePhone({required this.errorToSendCodeWithPhone});
}
