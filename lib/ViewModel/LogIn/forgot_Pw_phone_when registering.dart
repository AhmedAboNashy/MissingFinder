import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/Core/MyTheme/MyTheme.dart';
import 'package:missing_finder/Core/shared_preferences/constants/constants.dart';
import 'package:missing_finder/ViewModel/LogIn/reset_password.dart';
import 'package:missing_finder/ViewModel/Logic/Cubit/auth_cubit.dart';

class ForgetPwWhenLoginBySms extends StatefulWidget {
  static const String routeName = 'ForgetPWhenLoginSms';

  @override
  State<ForgetPwWhenLoginBySms> createState() => _ForgetPwWhenLoginBySmsState();
}

class _ForgetPwWhenLoginBySmsState extends State<ForgetPwWhenLoginBySms> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  TextEditingController num3 = TextEditingController();
  TextEditingController num4 = TextEditingController();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'ForgetPwWhenLoginByPhone');
  @override
  Widget build(BuildContext context) {
    var phone = ModalRoute.of(context)?.settings.arguments as String;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ActiveCodeSuccessStatePhone) {
          Navigator.pushNamed(context, ResetPassword.routeName);
        }
        if (state is ActiveCodeFailedStatePhone) {
          showAboutDialog(context: context, children: [
            Text(
              ' Code is failed, try again later',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            )
          ]);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Container(
            alignment: Alignment.center,
            height: 50.h,
            width: 70.w,
            child: Text(state.errorActiveSendCodeWithPhone),
          )));
        }
        ////////////////////  Resend Code  ////////////////////////////////////
        if (state is ResendCodeSuccessStatePhone) {
          // Navigator.pushNamed(context, ResetPassword.routeName);
        }
        if (state is ResendCodeFailedStatePhone) {
          showAboutDialog(context: context, children: [
            Text(
              ' Code is failed, try again later',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            )
          ]);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Container(
            alignment: Alignment.center,
            height: 50.h,
            width: 70.w,
            child: Text(state.errorToSendCodeWithPhone),
          )));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(MyTheme.backgroundGeneral),
          body: Padding(
            padding: EdgeInsets.all(20.r),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 30),
                    child: Text(
                      'Forget Your',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(MyTheme.textverifiCode)),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 50),
                    child: Text(
                      'Password?',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(MyTheme.textverifiCode)),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 80),
                    child: Text(
                      'Do not Worry  about Your Account ',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(MyTheme.textRegister)),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 120),
                    child: Text(
                      'Code Was Sent To Your Mobile Number',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(MyTheme.textRegister)),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.r),
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 200),
                      child: Form(
                        key: formKey,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 60.h,
                                    width: 53.w,
                                    child: TextField(
                                      controller: num1,
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 30.sp),
                                      cursorColor:
                                          Color(MyTheme.textverifiCode),
                                      cursorHeight: 22.h,
                                      cursorWidth: 1,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enableSuggestions: true,
                                      maxLength: 1,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor:
                                            Color(MyTheme.backgroundInterface),
                                        filled: true,
                                        hintStyle: TextStyle(
                                            color: Color(MyTheme.textRegister)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          borderSide:
                                              BorderSide(color: Colors.brown),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white10),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.r))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 60.h,
                                    width: 53.w,
                                    child: TextField(
                                      controller: num2,
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 30.sp),
                                      cursorColor:
                                          Color(MyTheme.textverifiCode),
                                      cursorHeight: 22.h,
                                      cursorWidth: 1,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enableSuggestions: true,
                                      maxLength: 1,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor:
                                            Color(MyTheme.backgroundInterface),
                                        filled: true,
                                        hintStyle: TextStyle(
                                            color: Color(MyTheme.textRegister)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          borderSide:
                                              BorderSide(color: Colors.brown),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white10),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.r))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 60.h,
                                    width: 53.w,
                                    child: TextField(
                                      controller: num3,
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 30.sp),
                                      cursorColor:
                                          Color(MyTheme.textverifiCode),
                                      cursorHeight: 22.h,
                                      cursorWidth: 1,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enableSuggestions: true,
                                      maxLength: 1,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor:
                                            Color(MyTheme.backgroundInterface),
                                        filled: true,
                                        hintStyle: TextStyle(
                                            color: Color(MyTheme.textRegister)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          borderSide:
                                              BorderSide(color: Colors.brown),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white10),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.r))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 60.h,
                                    width: 53.w,
                                    child: TextField(
                                      controller: num4,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                          // if (value.isEmpty) {
                                          // return 'Please enter your username';
                                          // }
                                          // return null;
                                        }
                                      },
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 30.sp),
                                      cursorColor:
                                          Color(MyTheme.textverifiCode),
                                      cursorHeight: 22.h,
                                      cursorWidth: 1,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enableSuggestions: true,
                                      maxLength: 1,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor:
                                            Color(MyTheme.backgroundInterface),
                                        filled: true,
                                        hintStyle: TextStyle(
                                            color: Color(MyTheme.textRegister)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          borderSide:
                                              BorderSide(color: Colors.brown),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white10),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.r))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 250),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'This Code expires in ',
                          style: TextStyle(
                              color: Color(MyTheme.textverifiCode),
                              fontSize: 15.sp),
                        ),
                        Text(
                          ' 5 Minutes',
                          style: TextStyle(
                              color: Color(MyTheme.textRegister),
                              fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 39.h,
                            width: 195.w,
                            child: FadeInRight(
                              delay: const Duration(milliseconds: 300),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.r)),
                                      side: BorderSide(
                                          color:
                                              Color(MyTheme.borderverifiCode)),
                                      backgroundColor:
                                          Color(MyTheme.back_verifi_Code)),
                                  onPressed: () {
                                    // Navigator.pushNamedAndRemoveUntil(context,
                                    //     ResetPassword.routeName, (route) => false);
                                    if (formKey.currentState!.validate() ==
                                        true) {
                                      // h3ml intance mn auth Cubit
                                      BlocProvider.of<AuthCubit>(context)
                                          .activePasswordWithPhone(
                                        loginKey: phone,
                                        activationCode: num1.text +
                                            num2.text +
                                            num3.text +
                                            num4.text,
                                      );
                                    } else {
                                      print(
                                          'Un Successfull verify code email ');
                                    }
                                  },
                                  child: Text(
                                    state is ActiveCodeLoadingStateWithPhone
                                        ? "Loading.."
                                        : 'Verify Code',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(
                                          MyTheme.text_Button,
                                        )),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 38.h,
                            width: 194.w,
                            child: FadeInRight(
                              delay: const Duration(milliseconds: 350),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.r)),
                                      side: BorderSide(
                                          color:
                                              Color(MyTheme.borderTextField)),
                                      backgroundColor:
                                          Color(MyTheme.bGround_Button)),
                                  onPressed: () {
                                    // Navigator.pushNamedAndRemoveUntil(context,
                                    //     ResetPassword.routeName, (route) => false);
                                    if (formKey.currentState!.validate() ==
                                        true) {
                                      // h3ml intance mn auth Cubit
                                      BlocProvider.of<AuthCubit>(context)
                                          .ResendCodeWithPhone(
                                        phone: phone,
                                      );
                                    } else {
                                      print(
                                          'Un Successfull verify code email ');
                                    }
                                  },
                                  child: Text(
                                    state is ResendCodeLoadingStateWithPhone
                                        ? "Loading.."
                                        : 'Resend Code',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(
                                          MyTheme.text_Button,
                                        )),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
