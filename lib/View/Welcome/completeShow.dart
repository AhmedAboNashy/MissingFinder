import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/Core/MyTheme/MyTheme.dart';
import 'package:missing_finder/ViewModel/Register/createAccount.dart';

class CompleteShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyTheme.backgroundGeneral),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Color(MyTheme.backgroundInterface),
              border: Border.all(color: Color(MyTheme.border))),
          height: 500.h,
          width: 280.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(20.r),
                child: FadeInRight(delay: const Duration(microseconds: 100),
                  child: Text(
                    'Continue...',
                    style: TextStyle(
                        color: Color(MyTheme.textColor),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: FadeInRight(delay: const Duration(milliseconds: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.r),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Color(MyTheme.Icon_white),
                                border:
                                    Border.all(color: Color(MyTheme.Icon_black))),
                            height: 13.h,
                            width: 14.w,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Color(MyTheme.Icon_black),
                              border:
                                  Border.all(color: Color(MyTheme.Icon_white))),
                          height: 13.h,
                          width: 14.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
          height: 65,
          width: double.infinity,
          color: Color(MyTheme.backgroundGeneral),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 280.w,
              ),
              InkWell(
                onTap: () {

                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return CreateAccount();
                  }));
                },
                child: FadeInRight(delay: const Duration(microseconds: 200),
                  child: Text(
                    'skip',
                    style: TextStyle(
                        color: Color(MyTheme.textColor),
                        decoration: TextDecoration.underline,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
