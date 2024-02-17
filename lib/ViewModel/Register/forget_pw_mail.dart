import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/Core/MyTheme/MyTheme.dart';
import 'package:missing_finder/ViewModel/LogIn/forgot_Pw_mail_when%20registering.dart';
import 'package:missing_finder/ViewModel/Logic/Cubit/auth_cubit.dart';
import 'package:missing_finder/ViewModel/Register/forget_pw_pohone.dart';

class ForgetPwByMail extends StatefulWidget {
  static const String routeName = 'ForgetPwByEmail';

  @override
  State<ForgetPwByMail> createState() => _ForgetPwByMailState();
}

class _ForgetPwByMailState extends State<ForgetPwByMail> {
  TextEditingController email = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(MyTheme.backgroundGeneral),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 80.h,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 30),
                child: Text('Forget',
                    style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          MyTheme.textverifiCode,
                        ))),
              ),
              SizedBox(
                height: 20.h,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 70),
                child: Text('Your Password',
                    style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          MyTheme.textverifiCode,
                        ))),
              ),
              SizedBox(
                height: 20.h,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 100),
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is ResetWithEmailSuccessState) {
                      Navigator.pushNamed(
                          context, ForgetPwWhenLoginByMail.routeName,
                          arguments: email.text);
                    }
                    if (state is ConfirmatinResetByMailToFailedState) {
                      showAboutDialog(context: context, children: [
                        Text(
                          ' E-Mail is failed, or Connect To Internet',
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
                        child: Text(state.ResetPassWithMail),
                      )));
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter The E-mail Address to get Link Reset',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(
                                  MyTheme.textColor,
                                ))),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Your Password',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(
                                  MyTheme.textColor,
                                ))),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 40.h),
              SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0.r),
                        child: SingleChildScrollView(
                          child: FadeInRight(
                            delay: const Duration(milliseconds: 200),
                            child: TextFormField(
                              controller: email,
                              enableSuggestions: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Color(MyTheme.bGround_Button),
                                filled: true,
                                labelStyle: TextStyle(
                                    color: Color(MyTheme.textverifiCode)),
                                hintStyle: TextStyle(
                                    color: Color(MyTheme.textverifiCode)),
                                hintText: ('E-mail address'),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.r)),
                                  borderSide: BorderSide(color: Colors.brown),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              FadeInRight(
                delay: const Duration(milliseconds: 250),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              ForgetPwByPhone.routeName, (route) => false);
                        },
                        icon: Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.r),
                                color: Color(MyTheme.back_verifi_Code)),
                            child: Icon(
                              Icons.call_outlined,
                              size: 30,
                            ))),
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.r),
                                color: Color(MyTheme.backTextField)),
                            child: Icon(
                              Icons.local_post_office,
                              size: 30,
                            ))),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 44.h,
                      width: 203.w,
                      child: FadeInRight(
                        delay: const Duration(milliseconds: 330),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.r)),
                                side: BorderSide(
                                    color: Color(MyTheme.borderTextField)),
                                backgroundColor: Color(MyTheme.bGround_Button)),
                            onPressed: () {
                              if (formKey.currentState!.validate() == true) {
                                // h3ml intance mn auth Cubit
                                BlocProvider.of<AuthCubit>(context)
                                    .RessetPasswordWithEmail(
                                  email: email.text,
                                );
                              } else {
                                print('Un Successfull');
                              }

                              // Navigator.pushNamedAndRemoveUntil(context,
                              //     ForgetPwWhenLoginByMail.routeName, (
                              //         route) => false);
                            },
                            child: Text(
                              AutofillHints.addressState
                                      is ConfirmatinResetByMailLoadingState
                                  ? "Loading.."
                                  : 'Continue',
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
                )
              ])
            ]),
          ),
        ));
  }
}
