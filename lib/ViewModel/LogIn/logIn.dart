import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/ViewModel/HomeScreen/home_screen.dart';
import 'package:missing_finder/ViewModel/Logic/Cubit/auth_cubit.dart';
import 'package:missing_finder/ViewModel/Register/createAccount.dart';
import 'package:missing_finder/ViewModel/Register/forget_pw_mail.dart';
import '../../Core/MyTheme/MyTheme.dart';

class LogIN extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LogIN> createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  bool isCheked = false;
  bool passwordOpsecure = true;
  String? _email, _password;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(MyTheme.backgroundGeneral),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
              SizedBox(
                height: 60.h,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 50),
                child: Text(
                  'Welcome Back !!',
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(MyTheme.textRegister)),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                  padding: EdgeInsets.all(30.r),
                  child: Form(
                      key: formKey,
                      child: BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is LogInSuccessState) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                HomeScreen.routeName, (route) => false);
                          }
                          if (state is FailedToLoginState) {
                            showAboutDialog(context: context, children: [
                              Text(
                                'E-mail is Failed ,or Connect To internet !!',
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
                              child: Text(state.message),
                            )));
                          }
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              FadeInRight(
                                delay: const Duration(milliseconds: 100),
                                child: TextFormField(
                                  controller: email,
                                  enableSuggestions: true,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        margin: EdgeInsets.all(2.0),
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: Color(MyTheme.back_Post),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Icon(
                                          Icons.local_post_office_rounded,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    fillColor:
                                        Color(MyTheme.backgroundInterface),
                                    filled: true,
                                    labelStyle: TextStyle(
                                        color: Color(MyTheme.textRegister)),
                                    hintStyle: TextStyle(
                                        color: Color(MyTheme.textRegister)),
                                    hintText: ('E-mail or mobile phone'),
                                    labelText: '  E-mail or mobile phone',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.r)),
                                      borderSide:
                                          BorderSide(color: Colors.brown),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white10),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.r))),
                                  ),
                                  validator: (value) {
                                    if (email.text.trim().isEmpty == null) {
                                      return 'Please Enter E-mail or Phone';
                                    }

                                    var regex = RegExp(r'^[^@]+@[^\.]+\..+');

                                    // r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$]');
                                    if (!regex.hasMatch(email.text)) {
                                      return "Invalid e-mail";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              FadeInRight(
                                delay: const Duration(milliseconds: 170),
                                child: TextFormField(
                                    controller: password,
                                    enableSuggestions: true,
                                    obscuringCharacter: '*',
                                    obscureText: passwordOpsecure,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(1.0.r),
                                        child: Container(
                                          margin: EdgeInsets.all(2.0.r),
                                          height: 5,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: Color(MyTheme.back_Post),
                                              borderRadius:
                                                  BorderRadius.circular(30.r)),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                passwordOpsecure =
                                                    !passwordOpsecure;
                                              });
                                            },
                                            icon: Icon(
                                              passwordOpsecure
                                                  ? Icons.lock_outline_rounded
                                                  : Icons.lock_open_rounded,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      fillColor:
                                          Color(MyTheme.backgroundInterface),
                                      filled: true,
                                      labelStyle: TextStyle(
                                          color: Color(MyTheme.textRegister)),
                                      hintStyle: TextStyle(
                                          color: Color(MyTheme.textRegister)),
                                      hintText: ('Password'),
                                      labelText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r)),
                                        borderSide:
                                            BorderSide(color: Colors.brown),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white10),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.r))),
                                    ),
                                    validator: (value) {
                                      if (password.text.trim().isEmpty ==
                                          null) {
                                        return 'Please Enter Password';
                                      }
                                    }),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                    width: 295.w,
                                    child: FadeInRight(
                                      delay: const Duration(milliseconds: 220),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        40.r)),
                                            side: BorderSide(
                                                color: Color(
                                                    MyTheme.borderTextField)),
                                            backgroundColor:
                                                Color(MyTheme.bGround_Button),
                                          ),
                                          onPressed: () {
                                            if (formKey.currentState!
                                                    .validate() ==
                                                true) {
                                              // h3ml instance mn auth Cubit
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .logIn(
                                                      loginKey: email.text,
                                                      password: password.text);
                                            } else {
                                              print('Un Successfull');
                                            }
                                            // Navigator.pushNamed(context,
                                            //     HomeScreen.routeName);
                                          },
                                          child: Text(
                                            state is LogInLoadingState
                                                ? "Loading.."
                                                : 'LogIn',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(
                                                MyTheme.textLogIn,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              FadeInRight(
                                delay: const Duration(milliseconds: 270),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                              checkColor:
                                                  Color(MyTheme.Icon_black),
                                              value: isCheked,
                                              activeColor:
                                                  Color(MyTheme.backTextField),
                                              onChanged: (newBool) {
                                                setState(() {
                                                  isCheked = newBool!;
                                                });
                                              }),
                                          Text(
                                            'Remember Me',
                                            style: TextStyle(
                                                color: Color(MyTheme.textColor),
                                                fontSize: 14.sp),
                                          ),
                                          SizedBox(
                                            width: 35.w,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  ForgetPwByMail.routeName,
                                                  (route) => false);
                                            },
                                            child: Text(
                                              'Forget Password?',
                                              style: TextStyle(
                                                  color:
                                                      Color(MyTheme.textColor),
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              FadeInRight(
                                delay: const Duration(milliseconds: 320),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Dont have an account?',
                                      style: TextStyle(
                                          color: Color(MyTheme.textColor)),
                                    ),
                                    SizedBox(
                                      width: 5.sp,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, CreateAccount.routeName);
                                        },
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )))
            ]))));
  }
}
