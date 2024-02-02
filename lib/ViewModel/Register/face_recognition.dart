import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:missing_finder/Core/MyTheme/MyTheme.dart';
import 'package:missing_finder/ViewModel/Register/confirmation_code_sms.dart';

class FaceRecognition extends StatefulWidget {
  static const String routeName = 'pesonal';

  @override
  State<FaceRecognition> createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  File? _image;

  var _start_date;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(MyTheme.backgroundGeneral),
        body: Padding(
          padding: EdgeInsets.all(14.r),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Face Detection',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(
                                MyTheme.textRegister,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 100),
                    child: Container(
                      height: 200.h,
                      width: 230.w,
                      color: Colors.grey,
                      child: _image == null
                          ? Center(
                              child: Icon(
                                Icons.linked_camera,
                                size: 40.sp,
                                color: Colors.black,
                              ),
                            )
                          : FittedBox(
                              fit: BoxFit.fill, child: Image.file(_image!)),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 44.h,
                        width: 203.w,
                        child: FadeInRight(
                          delay: const Duration(milliseconds: 320),
                          child: ElevatedButton.icon(
                            label: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Camera     ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(
                                        MyTheme.te_Co_Continue,
                                      ))),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.r)),
                                side: BorderSide(
                                    color: Color(MyTheme.borderTextField)),
                                backgroundColor: Color(MyTheme.bGround_Button)),
                            onPressed: () {
                              _pickImage(ImageSource.camera);
                              //select from camera
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 44.h,
                        width: 203.w,
                        child: FadeInRight(
                          delay: const Duration(milliseconds: 320),
                          child: ElevatedButton.icon(
                            label: Icon(
                              Icons.terrain_rounded,
                              color: Colors.black,
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Upload File',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(
                                        MyTheme.te_Co_Continue,
                                      ))),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.r)),
                                side: BorderSide(
                                    color: Color(MyTheme.borderTextField)),
                                backgroundColor: Color(MyTheme.bGround_Button)),
                            onPressed: () {
                              _pickImage(ImageSource.gallery);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 170),
                    child: Row(
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: Color(MyTheme.textRegister)),
                        ),
                        SizedBox(
                          width: 58.w,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 37.h,
                              width: 90.w,
                              child: TextButton(
                                onPressed: () {
                                  isMale = true;
                                  setState(() {});
                                },
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(MyTheme.textColor)),
                                ),
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  side: BorderSide(color: Colors.brown),
                                  backgroundColor: Color(
                                    isMale
                                        ? 0xff707070
                                        : MyTheme.backgroundInterface,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            SizedBox(
                              height: 37.h,
                              width: 90.w,
                              child: TextButton(
                                onPressed: () {
                                  isMale = false;
                                  setState(() {});
                                },
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(MyTheme.textColor)),
                                ),
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  side: BorderSide(color: Colors.brown),
                                  backgroundColor: Color(
                                    !isMale
                                        ? 0xffffff
                                        : MyTheme.backgroundInterface,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 250),
                    child: Row(
                      children: [
                        Text(
                          'Date Of Birth',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: Color(MyTheme.textRegister)),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Stack(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 35.h,
                                  width: 60.w,
                                  child: FadeInRight(
                                    delay: const Duration(milliseconds: 350),
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15.sp),
                                      cursorColor:
                                          Color(MyTheme.textverifiCode),

                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enableSuggestions: true,
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        fillColor:
                                            Color(MyTheme.backgroundInterface),
                                        filled: true,
                                        labelStyle: TextStyle(
                                            color: Color(MyTheme.textRegister)),
                                        iconColor: Colors.white,
                                        hintStyle: TextStyle(
                                          color: Color(
                                            MyTheme.textRegister,
                                          ),
                                        ),
                                        hintText: ('DD'),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          borderSide:
                                              BorderSide(color: Colors.brown),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            borderSide: BorderSide(
                                                color: Colors.white10)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Please Enter Day';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                  // onPressed: () {},
                                  // child: Text(
                                  //   'DD',
                                  //   style: TextStyle(
                                  //       fontSize: 16.sp,
                                  //       color: Color(MyTheme.textColor)),
                                  // ),
                                  // style: TextButton.styleFrom(
                                  //   shape: RoundedRectangleBorder(
                                  //       borderRadius:
                                  //           BorderRadius.circular(20.r)),
                                  //   side: BorderSide(color: Colors.brown),
                                  //   backgroundColor: Color(
                                  //     MyTheme.backgroundInterface,
                                  //   ),
                                  // ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SizedBox(
                                  height: 35.h,
                                  width: 60.w,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15.sp),
                                    cursorColor:
                                    Color(MyTheme.textverifiCode),

                                    textAlignVertical:
                                    TextAlignVertical.center,
                                    enableSuggestions: true,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      fillColor:
                                      Color(MyTheme.backgroundInterface),
                                      filled: true,
                                      labelStyle: TextStyle(
                                          color: Color(MyTheme.textRegister)),
                                      iconColor: Colors.white,
                                      hintStyle: TextStyle(
                                        color: Color(
                                          MyTheme.textRegister,
                                        ),
                                      ),
                                      hintText: ('MM'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r)),
                                        borderSide:
                                        BorderSide(color: Colors.brown),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          borderSide: BorderSide(
                                              color: Colors.white10)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please Enter Day';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SizedBox(
                                  height: 35.h,
                                  width: 60.w,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15.sp),
                                    cursorColor:
                                    Color(MyTheme.textverifiCode),

                                    textAlignVertical:
                                    TextAlignVertical.center,
                                    enableSuggestions: true,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      fillColor:
                                      Color(MyTheme.backgroundInterface),
                                      filled: true,
                                      labelStyle: TextStyle(
                                          color: Color(MyTheme.textRegister)),
                                      iconColor: Colors.white,
                                      hintStyle: TextStyle(
                                        color: Color(
                                          MyTheme.textRegister,
                                        ),
                                      ),
                                      hintText: ('yyyy'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r)),
                                        borderSide:
                                        BorderSide(color: Colors.brown),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          borderSide: BorderSide(
                                              color: Colors.white10)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please Enter Day';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 44.h,
                        width: 203.w,
                        child: FadeInRight(
                          delay: const Duration(milliseconds: 320),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(40.r)),
                                  side: BorderSide(
                                      color: Color(MyTheme.borderTextField)),
                                  backgroundColor:
                                      Color(MyTheme.bGround_Button)),
                              onPressed: () {
                                Navigator.restorablePushNamedAndRemoveUntil(
                                    context,
                                    ConfirmationSms.routeName,
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
                ]),
          ),
        ));
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      //Wait for the user to select the image (source = select image from user )
      // from gallery & camera
      if (image == null) {
        return;
      }
      setState(() {
        _image = File(image.path);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
        //error
      }
    }
  }

  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}

//
//   void pickImage() async{
//     var image=await ImagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _image=_image;
//     });
//   }
// }
//
