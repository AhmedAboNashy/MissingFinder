import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/Core/MyTheme/MyTheme.dart';
import 'package:missing_finder/View/Welcome/displayScreens.dart';

class InterFace extends StatelessWidget {
  static const String routeName = ('/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyTheme.backgroundGeneral),
      body: Center(
        child: FadeInDown(delay: const Duration(microseconds: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(MyTheme.textColor)),
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35.h, vertical: 15.w),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      backgroundColor: Color(MyTheme.bGround_Button)),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return DisplayScreens();
                    }));
                  },
                  child: Text(
                    'about us',
                    style: TextStyle(
                        color: Color(MyTheme.textColor),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
