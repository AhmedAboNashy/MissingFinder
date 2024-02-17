import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:missing_finder/Model/Models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static const String base_Url = 'https://render-missing-finder.onrender.com';

  AuthCubit() : super(AuthInitialState());

  ///////////////////////////////// logIn ////////////////////////////////////////////////////////

  void logIn({required String loginKey, required String password}) async {
    emit(LogInLoadingState());
    try {
      var data = jsonEncode({"loginKey": loginKey, "password": password});
      Response response = await http.post(Uri.parse('$base_Url/auth/login'),
          body: data, headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy1000@gmail.com",
      //  "Ahmed@1234"
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var res = AuthModel.fromJson(responseData);
        if (res.success == true) {
          debugPrint("User Login Success and his data is : $res");

          var prefs = await SharedPreferences.getInstance();
          prefs.setString("token", res.auth!);
          // await CacheNetwork.SetToCache(
          //     key: "token", value: responseData['data']['token']);
          // await CacheNetwork.SetToCache(key: "password", value: password);
          // userToken = await CacheNetwork.getCachData(key: 'userToken');
          // passwordInbodyFromPostMan =
          //     await CacheNetwork.getCachData(key: 'password');
          emit(LogInSuccessState());
        } else {
          print(responseData['Message']);
          debugPrint(
              "Failed To Login, reason is  : ${responseData['Message']} ");
          emit(FailedToLoginState(message: responseData['Message']));
        }
      }
    } catch (e) {
      print(e.toString());
      emit(FailedToLoginState(message: e.toString()));
    }
  }

  //////////////////////////////////// Resset Password With Email ////////////////////////////////////////////

  void RessetPasswordWithEmail({required String email}) async {
    emit(ConfirmatinResetByMailLoadingState());
    print("$email,hereeeeee is Loading.... ");
    try {
      var data = jsonEncode({"email": email});
      Response response = await http.post(
          Uri.parse('$base_Url/auth/forgetcode/email'),
          body: data,
          headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy1000@gmail.com",
      //  "Ahmed@123"
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['success'] == true) {
          debugPrint(" Done : $responseData");
          // await  CacheNetwork.inserToCache(key: "token", value: responseData['data']['token']);
          emit(ResetWithEmailSuccessState());
        } else {
          print(responseData['Message']);
          debugPrint("Failed E-mail  : ${responseData['Message']} ");
          emit(ConfirmatinResetByMailToFailedState(
              ResetPassWithMail: responseData['Message']));
        }
      }
    } catch (e) {
      print(e.toString());
      emit(
          ConfirmatinResetByMailToFailedState(ResetPassWithMail: e.toString()));
    }
  }

////////////////////////////////  Reset Password  With Phone ///////////////////////////////////////////////

  void RessetPasswordWithPhone({required String phone}) async {
    emit(ResetWithPhoneSuccessState());
    try {
      var data = jsonEncode({"email": phone});
      Response response = await http.patch(
          Uri.parse('$base_Url/auth/resetPass/phone'),
          body: data,
          headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy526@gmail.com",
      //  "Ahmed@123"
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['success'] == true) {
          debugPrint(" Done : $responseData");
          // await  CacheNetwork.inserToCache(key: "token", value: responseData['data']['token']);
          emit(ResetWithPhoneSuccessState());
        } else {
          print(responseData['Message']);
          debugPrint("Phone Is Failed : ${responseData['Message']} ");
          emit(ConfirmatinResetByPhoneToFailedState(
              ResetPassWithPhone: responseData['Message']));
        }
      }
    } catch (e) {
      print(e.toString());
      emit(ConfirmatinResetByPhoneToFailedState(
          ResetPassWithPhone: e.toString()));
    }
  }

  ////////////////////////////  Change Password ////////////////////////////////////////////////////////////

  void ChangePassword({
    required String password,
    required String confirmPassword,
    required String email,

    //required String confirmPassword
  }) async {
    emit(ChangePasswordLoadingState());
    var data = jsonEncode({
      //key
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    });
    Response response = await http.patch(
        //5 Document
        Uri.parse("$base_Url/auth/resetPass/email"),
        headers: {
          "Content-Type": "application/json",
        },
        body: data);
    //convert json to dart opject tb h3ml disconnect w htsl beek elawl insta ...wla nd5ols google meet
    var responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (responseDecoded['success'] == true) {
        emit(ChangePasswordSuccessState());
      } else {
        emit(ChangePasswordFailedState(responseDecoded['Message']));
      }
    } else {
      emit(ChangePasswordFailedState("Something went wrong,try again later "));
    }
  }

/////////////////////////////////// Resend Code With Email /////////////////////////////////////////////////////

  void ResendCodeWithEmail({required String email}) async {
    emit(ResendCodeLoadingStateWithEmail());
    try {
      var data = jsonEncode({"email": email});
      Response response = await http.patch(
          Uri.parse('$base_Url/auth/reconfirmResetPass/email'),
          body: data,
          headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy1000@gmail.com",
      //  "Ahmed@123"
      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(ResendCodeSuccessStateEmail());
      } else {
        print(responseData['message']);
        debugPrint(
            "Failed To Resend Code, reason is  : ${responseData['message']} ");
        emit(ResendCodeFailedStateEmail(
            errorToSendCodeWithEmail: responseData['message']));
      }
    } catch (e) {
      print(e.toString());
      emit(ResendCodeFailedStateEmail(errorToSendCodeWithEmail: e.toString()));
    }
  }

//////////////////////////////// Active Account Password With Email ////////////////////////////////////////////

  void activePasswordWithEmail(
      {required String forgetCode, required String email}) async {
    emit(ActiveCodeLoadingStateWithEmail());
    print(forgetCode);
    try {
      var data = jsonEncode({"forgetCode": forgetCode, "email": email});
      var response = await http.patch(
          Uri.parse('$base_Url/auth/coderesetPass/email'),
          body: data,
          headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy1000@gmail.com",
      //  "Ahmed@12345"
      print(response.statusCode);
      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['success'] == true) {
          emit(ActiveCodeSuccessStateEmail());
        } else {
          emit(ActiveCodeFailedStateEmail(
              errorActiveSendCodeWithEmail: responseData['message']));
        }
      } else {
        print(responseData['message']);
        debugPrint("Failed Active Code  : ${responseData['message']} ");
        emit(ActiveCodeFailedStateEmail(
            errorActiveSendCodeWithEmail: responseData['message']));
      }
    } catch (e) {
      print(e.toString());
      emit(ActiveCodeFailedStateEmail(
          errorActiveSendCodeWithEmail: e.toString()));
    }
  }

//////////////////////////////// Active Account Password With Phone ////////////////////////////////////////////

  void activePasswordWithPhone(
      {required String activationCode, required String loginKey}) async {
    emit(ActiveCodeLoadingStateWithPhone());
    try {
      var data =
          jsonEncode({"activationCode": activationCode, "loginKey": loginKey});
      var response = await http.post(
          Uri.parse('$base_Url/auth/activateAccount'),
          body: data,
          headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy1000@gmail.com",
      //  "Ahmed@123"
      print(response.statusCode);
      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // debugPrint(" Done : $responseData");
        // await  CacheNetwork.inserToCache(key: "token", value: responseData['data']['token']);
        emit(ActiveCodeSuccessStatePhone());
      } else {
        print(responseData['message']);
        debugPrint("Failed Active Code  : ${responseData['message']} ");
        emit(ActiveCodeFailedStatePhone(
            errorActiveSendCodeWithPhone: responseData['message']));
      }
    } catch (e) {
      print(e.toString());
      emit(ActiveCodeFailedStatePhone(
          errorActiveSendCodeWithPhone: e.toString()));
    }
  }

/////////////////////////////////// Resend Code With Phone /////////////////////////////////////////////////////

  void ResendCodeWithPhone({required String phone}) async {
    emit(ResendCodeLoadingStateWithPhone());
    try {
      var data = jsonEncode({"phone": phone});
      Response response = await http.patch(
          Uri.parse('$base_Url/auth/reconfirmResetPass/phone'),
          body: data,
          headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy1000@gmail.com",
      //  "Ahmed@123"
      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(ResendCodeSuccessStatePhone());
      } else {
        print(responseData['message']);
        debugPrint(
            "Failed To Resend Code, reason is  : ${responseData['message']} ");
        emit(ResendCodeFailedStatePhone(
            errorToSendCodeWithPhone: responseData['message']));
      }
    } catch (e) {
      print(e.toString());
      emit(ResendCodeFailedStatePhone(errorToSendCodeWithPhone: e.toString()));
    }
  }
}
