import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:missing_finder/Core/shared_preferences/constants/constants.dart';
import 'package:missing_finder/Core/shared_preferences/local_network.dart';
import 'package:path/path.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static const String base_Url = 'https://render-missing-finder.onrender.com';

  AuthCubit() : super(AuthInitialState());
  //////////
  void logIn({required String loginKey, required String password}) async {
    emit(LogInLoadingState());
    try {
      var data = jsonEncode({"loginKey": loginKey, "password": password});
      Response response = await http.post(
          Uri.parse('https://render-missing-finder.onrender.com/auth/login'),
          body: data,
          headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy1000@gmail.com",
      //  "Ahmed@123"
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['success'] == true) {

          debugPrint("User Login Success and his data is : $responseData");
         //   await  CacheNetwork.SetToCache(key: "token", value: responseData['data']['token']);
         //   await  CacheNetwork.SetToCache(key: "password", value: password);
         // userToken = await CacheNetwork.getCachData(key: 'token');
         // currentPassword = await CacheNetwork.getCachData(key: 'password');
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

  //////////////////////////////////
  void RessetPasswordWithEmail({required String email}) async {
    try {
      var data = jsonEncode({"email": email});
      Response response = await http.patch(
          Uri.parse(
              'https://render-missing-finder.onrender.com/auth/reconfirmResetPass/email'),
          body: data,
          headers: {"Content-Type": "application/json"});
      //  "ahmedabonashy526@gmail.com",
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

///////////////////////////////////
  void RessetPasswordWithPhone({required String phone}) async {
    emit(ResetWithPhoneSuccessState());
    try {
      var data = jsonEncode({"email": phone});
      Response response = await http.patch(
          Uri.parse(
              'https://render-missing-finder.onrender.com/auth/reconfirmResetPass/email'),
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

  ///////////////////////

  void ResetPassword(
      {required String currentPassword,
      required String confirmPassword}) async {
    emit(ChangePasswordLoadingState());
    Response response = await http.post(
        //5 Document
        Uri.parse("$base_Url/auth/resetPass/email"),
        headers: {
          "Content-Type": "application/json",
          "Postman-Token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI 6IjY1NmNmMDA5YzYxY2ViMmE5Nzhj"
                  "NjU0OSIsImlhdCI6MTcwMTYzOD E1My"
                  "wiZXhwIjoxNzAxNjQ1MzUzfQ.8KLHNcEwqP4JalBqNLH1Eyvdo6 irU_4oF6Z9E1swr_k",
        },
        body: {
          //key
          "password": currentPassword,
          "confirmPassword": confirmPassword
        });
    //convert json to dart opject
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
}
