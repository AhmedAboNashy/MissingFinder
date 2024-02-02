import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/Core/shared_preferences/local_network.dart';
import 'package:missing_finder/ViewModel/LogIn/logIn.dart';
import '../../Core/MyTheme/MyTheme.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = 'resetPassword';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool passwordOpsecure1 = true;
  bool passwordOpsecure2 = true;
  TextEditingController newPassword = TextEditingController();
  TextEditingController currentPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyTheme.backgroundGeneral),
      body: Padding(
        padding: EdgeInsets.all(14.r),
        child: SingleChildScrollView(
          child:
              Form(
                key: formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  'letters, and Punctuation MArks.',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(MyTheme.textRegister)),
                ),
            ),
            SizedBox(
                height: 50.h,
            ),
            FadeInRight(
                delay: const Duration(microseconds: 300),
                child: TextFormField(

                  controller: currentPassword,
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
                    labelStyle: TextStyle(color: Color(MyTheme.textRegister)),
                    hintStyle: TextStyle(color: Color(MyTheme.textRegister)),
                    hintText: ('Enter New Password'),
                    labelText: 'Enter New Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white10),
                        borderRadius: BorderRadius.circular(20.r)),
                  ),
                  validator: (value) {
                    if (currentPassword.text.trim().isEmpty == null) {
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

                  controller: currentPassword,
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
                    labelStyle: TextStyle(color: Color(MyTheme.textRegister)),
                    hintStyle: TextStyle(color: Color(MyTheme.textRegister)),
                    hintText: ('Confirm New Password'),
                    labelText: 'Confirm New Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white10),
                        borderRadius: BorderRadius.circular(20.r)),
                  ),
                  validator: (value) {
                    if (currentPassword.text.trim().isEmpty == null) {
                      return 'Please Enter Password';
                    }

                    return null;
                  },
                ),
            ),
            SizedBox(
                height: 30.h,
            ),
            SingleChildScrollView(
                child: Column(
                  children: [
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
                                  debugPrint('ahmed abonashy');
                                  CacheNetwork.SetToCache(key: "password", value: newPassword.text);
                                  CacheNetwork.SetToCache(key: "confirmPassword", value: currentPassword.text);
                                  if(newPassword==currentPassword){
                                    // Navigator.pushNamedAndRemoveUntil(
                                    //     context, LogIN.routeName, (route) => false);
                                  }else{
                                   'they are not the same';
                                  }

                                },
                                child: Text(
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
                ),
            )
          ]),
              ),
        ),
      ),
    );
  }
}

extension Sizer on BuildContext {
  double get h => MediaQuery.of(this).size.height;
  double get w => MediaQuery.of(this).size.width;
}

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
