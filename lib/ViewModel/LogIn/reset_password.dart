import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/ViewModel/LogIn/logIn.dart';
import 'package:missing_finder/ViewModel/Logic/Cubit/auth_cubit.dart';
import '../../Core/MyTheme/MyTheme.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = 'resetPassword';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool passwordOpsecure1 = true;
  bool passwordOpsecure2 = true;
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color(MyTheme.backgroundGeneral),
      body: Padding(
        padding: EdgeInsets.all(14.r),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 50.h,
              ),
              FadeInDown(
                delay: const Duration(microseconds: 50),
                child: Text(
                  'Forget Your ',
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
                delay: const Duration(microseconds: 100),
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
                delay: const Duration(microseconds: 150),
                child: Text(
                  'Strong Password include Numbers,',
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
                delay: const Duration(microseconds: 200),
                child: Text(
                  'letters, and Punctuation Marks.',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(MyTheme.textRegister)),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
                if (state is ChangePasswordSuccessState) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LogIN.routeName, (route) => false);
                }
                if (state is ChangePasswordFailedState) {
                  showAboutDialog(context: context, children: [
                    Text(
                      'Password is Failed ,or Connect To internet !!',
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
                    height: 20.h,
                    width: 40.w,
                    child: Text(state.error),
                  )));
                }
                // TODO: implement listener
              }, builder: (context, state) {
                return Column(
                  children: [
                    FadeInRight(
                      delay: const Duration(microseconds: 300),
                      child: TextFormField(
                        controller: password,
                        obscuringCharacter: '*',
                        obscureText: passwordOpsecure1,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordOpsecure1 = !passwordOpsecure1;
                              });
                            },
                            icon: Icon(
                              passwordOpsecure1
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ),
                          ),
                          fillColor: Color(MyTheme.backgroundInterface),
                          filled: true,
                          labelStyle:
                              TextStyle(color: Color(MyTheme.textRegister)),
                          hintStyle:
                              TextStyle(color: Color(MyTheme.textRegister)),
                          hintText: ('Enter New Password'),
                          labelText: 'Enter New Password',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white10),
                              borderRadius: BorderRadius.circular(20.r)),
                        ),
                        validator: (value) {
                          if (newPassword.text.trim().isEmpty == null) {
                            return 'Please Enter New Password';
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 330),
                      child: TextFormField(
                        controller: newPassword,
                        obscuringCharacter: '*',
                        obscureText: passwordOpsecure2,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordOpsecure2 = !passwordOpsecure2;
                              });
                            },
                            icon: Icon(
                              passwordOpsecure2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ),
                          ),
                          fillColor: Color(MyTheme.backgroundInterface),
                          filled: true,
                          labelStyle:
                              TextStyle(color: Color(MyTheme.textRegister)),
                          hintStyle:
                              TextStyle(color: Color(MyTheme.textRegister)),
                          hintText: ('Confirm New Password'),
                          labelText: 'Confirm New Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white10),
                              borderRadius: BorderRadius.circular(20.r)),
                        ),
                        validator: (value) {
                          if (newPassword.text.trim().isEmpty == null) {
                            return 'Please Enter Password';
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                          width: 224.w,
                          child: FadeInRight(
                            delay: const Duration(milliseconds: 400),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.r)),
                                    side: BorderSide(color: Colors.brown),
                                    backgroundColor:
                                        Color(MyTheme.backgroundInterface)),
                                onPressed: () {
                                  BlocProvider.of<AuthCubit>(context)
                                      .ChangePassword(
                                    confirmPassword: newPassword.text,
                                    password: password.text,
                                    email: email,
                                  );
                                },
                                child: state is ChangePasswordLoadingState
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ))
                                    : Text(
                                        'Reset Password',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(
                                              MyTheme.te_Co_Continue,
                                            )),
                                      )),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ]),
          ),
        ),
      ),
    );
  }
}

// extension Sizer on BuildContext {
//   double get h => MediaQuery.of(this).size.height;
//   double get w => MediaQuery.of(this).size.width;
// }

//
// TextField(
// decoration: InputDecoration(
// hintText: ('E-mail or mobile phone'),
// labelText: 'E-mail or mobile phone',
// suffixIcon: Icon(Icons.email),
// border: OutlineInputBorder(
// borderSide:
// BorderSide(color: Colors.black),
// borderRadius:
// BorderRadius.circular(16.r),
// ),
// enabledBorder: OutlineInputBorder(
// borderSide: (BorderSide(
// color: Colors.black))),
// ),
// ),
// ),

// Form(
// key: formKey,
// child: BlocConsumer<AuthCubit, AuthState>(
// listener: (context, state) {
// if (state is ChangePasswordSuccessState) {
// Navigator.pushNamedAndRemoveUntil(
// context, LogIN.routeName, (route) => false);
// }
// if (state is ChangePasswordFailedState) {
// showAboutDialog(context: context, children: [
// Text(
// 'Password is Failed ,or Connect To internet !!',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.sp,
// color: Colors.black,
// ),
// )
// ]);
// ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// content: Container(
// alignment: Alignment.center,
// height: 20.h,
// width: 40.w,
// child: Text(state.error),
// )));
// }
// // TODO: implement listener
// }, builder: (context, state) {
