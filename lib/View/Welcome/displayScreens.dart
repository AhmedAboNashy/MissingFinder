import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/View/MyTheme/MyTheme.dart';
import 'package:missing_finder/View/Welcome/completeShow.dart';

class DisplayScreens extends StatelessWidget {
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
          height: 560.h,
          width: 300.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(20.r),
                child: Text(
                  'Continue...',

                  style: TextStyle(
                      color: Color(MyTheme.textColor),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.all(20.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.r),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Color(MyTheme.Icon_black),
                              border:
                              Border.all(color: Color(MyTheme.Icon_black))),
                          height: 12.h,
                          width: 13.w,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color(MyTheme.Icon_white),
                            border: Border.all(color: Color(MyTheme.Icon_white))),
                        height: 12.h,
                        width: 13.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),bottomSheet: Container(
      height: 65,width: double.infinity,
      color: Color(MyTheme.backgroundGeneral),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SizedBox(width: 280.w,),
          InkWell(onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return CompleteShow();
            }));
          },
            child: Text(
              'skip',
              style: TextStyle(color: Color(MyTheme.textColor),decoration:
              TextDecoration.underline,fontSize: 17.sp,fontWeight: FontWeight.w400),
            ),
          ),
        ],
      )
    ),
    );
  }
}
