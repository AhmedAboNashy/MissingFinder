import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/Core/MyTheme/MyTheme.dart';
import 'package:missing_finder/ViewModel/Register/confirmation_email.dart';
import 'package:missing_finder/ViewModel/Register/face_recognition.dart';

class ConfirmationSms extends StatelessWidget {
  static const String routeName = 'sms';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyTheme.backgroundGeneral),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 30),
                child: Text(
                  'Enter the confirmation',
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(MyTheme.textRegister)),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 70),
                child: Text(
                  'Code from the text',
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(MyTheme.textRegister)),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 100),
                child: Text(
                  'Message',
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(MyTheme.textRegister)),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              FadeInDown(
                delay: const Duration(microseconds: 130),
                child: Text(
                  'Enter the code in The Sms Sent To',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(MyTheme.textRegister)),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.all(20.r),
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
                            child: FadeInRight(
                              delay: const Duration(milliseconds: 150),
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30.sp),
                                cursorColor: Color(MyTheme.textverifiCode),
                                cursorHeight: 22.h,
                                cursorWidth: 1,
                                textAlignVertical: TextAlignVertical.center,
                                enableSuggestions: true,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: Color(MyTheme.backgroundInterface),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Color(MyTheme.textRegister)),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.brown),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white10),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.r))),
                                ),
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
                            child: FadeInRight(
                              delay: const Duration(milliseconds: 180),
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30.sp),
                                cursorColor: Color(MyTheme.textverifiCode),
                                cursorHeight: 22.h,
                                cursorWidth: 1,
                                textAlignVertical: TextAlignVertical.center,
                                enableSuggestions: true,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: Color(MyTheme.backgroundInterface),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Color(MyTheme.textRegister)),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.brown),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white10),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.r))),
                                ),
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
                            child: FadeInRight(
                              delay: const Duration(milliseconds: 220),
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30.sp),
                                cursorColor: Color(MyTheme.textverifiCode),
                                cursorHeight: 22.h,
                                cursorWidth: 1,
                                textAlignVertical: TextAlignVertical.center,
                                enableSuggestions: true,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: Color(MyTheme.backgroundInterface),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Color(MyTheme.textRegister)),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.brown),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white10),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.r))
                                  ),
                                ),
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
                            child: FadeInRight(
                              delay: const Duration(milliseconds: 260),
                              child: TextField(
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
                                cursorColor: Color(MyTheme.textverifiCode),
                                cursorHeight: 22.h,
                                cursorWidth: 1,
                                textAlignVertical: TextAlignVertical.center,
                                enableSuggestions: true,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: Color(MyTheme.backgroundInterface),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Color(MyTheme.textRegister)),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.brown),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white10),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.r))),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This Code expires in   ',
                      style: TextStyle(
                          color: Color(MyTheme.textverifiCode),
                          fontSize: 15.sp),
                    ),
                    Text(
                      '5 Minutes',
                      style: TextStyle(
                          color: Color(MyTheme.textRegister), fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: FadeInRight(
                  delay: const Duration(milliseconds: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 39.h,
                        width: 195.w,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.r)),
                                side: BorderSide(
                                    color: Color(MyTheme.borderverifiCode)),
                                backgroundColor:
                                    Color(MyTheme.back_verifi_Code)),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ConfirmationEmail.routeName);
                            },
                            child: Text(
                              'Verify Code',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(
                                    MyTheme.text_Button,
                                  )),
                            )),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 38.h,
                        width: 194.w,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.r)),
                                side: BorderSide(
                                    color: Color(MyTheme.borderTextField)),
                                backgroundColor: Color(MyTheme.bGround_Button)),
                            onPressed: () {},
                            child: Text(
                              'Resend Code',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(
                                    MyTheme.text_Button,
                                  )),
                            )),
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
  }
}
