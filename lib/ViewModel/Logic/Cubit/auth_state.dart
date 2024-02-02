part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {

}

class LogInSuccessState extends AuthState{}
class LogInLoadingState extends AuthState{}
class FailedToLoginState extends AuthState{

  // 3l4an a3rf el error feen
  final String message;
  FailedToLoginState({required this.message});

}

/////////////////
class ResetWithEmailSuccessState extends AuthState{}
class ConfirmatinResetByMailLoadingState extends AuthState{}
class ConfirmatinResetByMailToFailedState extends AuthState{

  // 3l4an a3rf el error feen
  final String ResetPassWithMail;
  ConfirmatinResetByMailToFailedState({required this.ResetPassWithMail});

}



/////////////////////
class ResetWithPhoneSuccessState extends AuthState{}
class ConfirmatinResetByPhoneLoadingState extends AuthState{}
class ConfirmatinResetByPhoneToFailedState extends AuthState{

  // 3l4an a3rf el error feen
  final String ResetPassWithPhone;
  ConfirmatinResetByPhoneToFailedState({required this.ResetPassWithPhone});

}
////////////
class ChangePasswordLoadingState extends AuthState{}
class ChangePasswordSuccessState extends AuthState{}
class ChangePasswordFailedState extends AuthState{
  String error;
  ChangePasswordFailedState(this.error);

}
