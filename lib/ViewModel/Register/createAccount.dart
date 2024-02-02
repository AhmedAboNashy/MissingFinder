import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder/ViewModel/LogIn/logIn.dart';
import 'package:missing_finder/ViewModel/Register/face_recognition.dart';
import '../../Core/MyTheme/MyTheme.dart';

class CreateAccount extends StatefulWidget {
  static const String routeName = 'create';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? _name, _lastName, _email, _phone, _password, _confirmPassword;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emairOrMopilePhone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyTheme.backgroundGeneral),
      body: Padding(
        padding: EdgeInsets.all(14.r),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20.h,
            ),
            FadeInDown(
              delay: const Duration(microseconds: 50),
              child: Text('Create',
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(
                        MyTheme.textColor,
                      ))),
            ),
            SizedBox(
              height: 10.h,
            ),
            FadeInDown(
              delay: const Duration(microseconds: 100),
              child: Text('New Account',
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(
                        MyTheme.textColor,
                      ))),
            ),
            SizedBox(
              height: 15.h,
            ),
            FadeInDown(
              delay: const Duration(microseconds: 200),
              child: Row(
                children: [
                  Text('Already A Member? ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            MyTheme.textColor,
                          ))),
                  SizedBox(width: 5.w),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LogIN.routeName, (route) => false);
                    },
                    child: Text('login',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              MyTheme.createAccount_login,
                            ))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            Form(
              key: formKey,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      FadeInRight(
                        delay: const Duration(microseconds: 300),
                        child: TextFormField(
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            fillColor: Color(MyTheme.backgroundInterface),
                            filled: true,
                            labelStyle:
                                TextStyle(color: Color(MyTheme.textRegister)),
                            hintStyle:
                                TextStyle(color: Color(MyTheme.textRegister)),
                            hintText: ('First Name'),
                            labelText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                borderSide: BorderSide(color: Colors.white10)),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          onSaved: (name) {
                            _name = name;
                          },
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      FadeInRight(
                        delay: const Duration(milliseconds: 350),
                        child: TextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                          decoration: InputDecoration(
                            fillColor: Color(MyTheme.backgroundInterface),
                            filled: true,
                            labelStyle:
                                TextStyle(color: Color(MyTheme.textRegister)),
                            iconColor: Colors.cyan,
                            hintStyle:
                                TextStyle(color: Color(MyTheme.textRegister)),
                            hintText: ('Last Name'),
                            labelText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                borderSide: BorderSide(color: Colors.white10)),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter Last Name';
                            }
                            return null;
                          },
                          onSaved: (lastName) {
                            _lastName = lastName;
                          },
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Form(
              key: formKey2,
              child: Column(
                children: [
                  FadeInRight(
                    delay: const Duration(milliseconds: 400),
                    child: TextFormField(
                      controller: emairOrMopilePhone,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Color(MyTheme.backgroundInterface),
                        filled: true,
                        labelStyle:
                            TextStyle(color: Color(MyTheme.textRegister)),
                        hintStyle:
                            TextStyle(color: Color(MyTheme.textRegister)),
                        hintText: ('E-mail or mobile phone'),
                        labelText: 'E-mail or mobile phone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            borderSide: BorderSide(color: Colors.white10)),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter E-mail or Phone';
                        }

                        var regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!regex.hasMatch(value)) {
                          return "Enter a valid e-mail";
                        }
                      },
                      // saved mail
                      onSaved: (email) {
                        _email = email;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 450),
                    child: TextFormField(
                      obscuringCharacter: '*',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        fillColor: Color(MyTheme.backgroundInterface),
                        filled: true,
                        labelStyle:
                            TextStyle(color: Color(MyTheme.textRegister)),
                        hintStyle:
                            TextStyle(color: Color(MyTheme.textRegister)),
                        hintText: ('Password'),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            borderSide: BorderSide(color: Colors.white10)),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      onSaved: (password) {
                        _password = password;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 500),
                    child: TextFormField(
                      obscuringCharacter: '*',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        fillColor: Color(MyTheme.backgroundInterface),
                        filled: true,
                        labelStyle:
                            TextStyle(color: Color(MyTheme.textRegister)),
                        hintStyle:
                            TextStyle(color: Color(MyTheme.textRegister)),
                        hintText: ('Confirm Password'),
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            borderSide: BorderSide(color: Colors.white10)),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Confirm Password';
                        }
                        return null;
                      },
                      onSaved: (confirmPassword) {
                        _confirmPassword = confirmPassword;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48.h,
                  width: 224.w,
                  child: FadeInRight(
                    delay: const Duration(microseconds: 600),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.r)),
                            side: BorderSide(
                                color: Color(MyTheme.borderTextField)),
                            backgroundColor: Color(MyTheme.bGround_Button)),
                        onPressed: () {
                          // if (formKey.currentState!.validate()==true) {
                          //   BlocProvider.of<AuthCubit>(context).logIn(
                          //       phone: email.text,
                          //       password: password.text);
                          // } else {
                          //   print('Un Successfull');
                          // }

                          Navigator.pushNamed(
                              context, FaceRecognition.routeName);

                          if (formKey.currentState!.validate()) {
                            return;
                          } else {
                            if (formKey2.currentState!.validate()) {}
                          }
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
          ]),
        ),
      ),
    );
  }
}

extension Sizer on BuildContext {
  double get h => MediaQuery.of(this).size.height;
  double get w => MediaQuery.of(this).size.width;
}
