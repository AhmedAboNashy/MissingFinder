import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/View/Welcome/interFce.dart';
import 'package:missing_finder/ViewModel/LogIn/forgot_Pw_mail_when%20registering.dart';
import 'package:missing_finder/ViewModel/LogIn/forgot_Pw_phone_when%20registering.dart';
import 'package:missing_finder/ViewModel/LogIn/logIn.dart';
import 'package:missing_finder/ViewModel/LogIn/reset_password.dart';
import 'package:missing_finder/ViewModel/Register/confirmation_code_sms.dart';
import 'package:missing_finder/ViewModel/Register/confirmation_email.dart';
import 'package:missing_finder/ViewModel/Register/createAccount.dart';
import 'package:missing_finder/ViewModel/Register/forget_pw_mail.dart';
import 'package:missing_finder/ViewModel/Register/forget_pw_pohone.dart';
import 'package:missing_finder/ViewModel/Register/face_recognition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          InterFace.routeName: (_) => InterFace(),
          CreateAccount.routeName: (_) => CreateAccount(),
          FaceRecognition.routeName: (_) => FaceRecognition(),
          ConfirmationSms.routeName: (_) => ConfirmationSms(),
          ConfirmationEmail.routeName: (_) => ConfirmationEmail(),
          LogIN.routeName: (_) => LogIN(),
          ForgetPwByPhone.routeName: (_) => ForgetPwByPhone(),
          ForgetPwByMail.routeName: (_) => ForgetPwByMail(),
          ForgetPwWhenLoginByMail.routeName: (_) => ForgetPwWhenLoginByMail(),
          ForgetPwWhenLoginBySms.routeName: (_) => ForgetPwWhenLoginBySms(),
          ResetPassword.routeName: (_) => ResetPassword(),
        },
        initialRoute: FaceRecognition.routeName,
      ),
    );
  }
}
