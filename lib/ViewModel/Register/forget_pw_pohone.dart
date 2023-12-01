import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/Core/MyTheme/MyTheme.dart';
import 'package:missing_finder/ViewModel/LogIn/forgot_Pw_mail_when%20registering.dart';
import 'package:missing_finder/ViewModel/Register/forget_pw_mail.dart';

class ForgetPwByPhone extends StatelessWidget {
  static const String routeName = 'ForgetCodePhone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(MyTheme.backgroundGeneral),
        body: Padding(
          padding: EdgeInsets.all(12.0.r),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(
                    delay: const Duration(milliseconds: 70),
                    child: Text('Enter Your Mobile Number to get Link Reset',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              MyTheme.textColor,
                            ))),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 100),
                    child: Text('Your Password',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              MyTheme.textColor,
                            ))),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0.r),
                      child: SingleChildScrollView(
                        child: FadeInRight(
                          delay: const Duration(milliseconds: 150),
                          child: TextField(
                            enableSuggestions: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Color(MyTheme.bGround_Button),
                              filled: true,
                              labelStyle: TextStyle(
                                  color: Color(MyTheme.textverifiCode)),
                              hintStyle: TextStyle(
                                  color: Color(MyTheme.textverifiCode)),
                              hintText: ('Mobile Number'),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.r)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.r))),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              FadeInRight(
                delay: const Duration(milliseconds: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.r),
                                color: Color(MyTheme.backTextField)),
                            child: Icon(
                              Icons.call_outlined,
                              size: 25.sp,
                            ))),
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              ForgetPwByMail.routeName, (route) => false);
                        },
                        icon: Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.r),
                                color: Color(MyTheme.back_verifi_Code)),
                            child: Icon(
                              Icons.local_post_office,
                              size: 25.sp,
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
                        delay: const Duration(milliseconds: 300),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.r)),
                                side: BorderSide(
                                    color: Color(MyTheme.borderTextField)),
                                backgroundColor: Color(MyTheme.bGround_Button)),
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  ForgetPwWhenLoginByMail.routeName,
                                  (route) => false);
                            },
                            child: Text(
                              'Continue',
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
