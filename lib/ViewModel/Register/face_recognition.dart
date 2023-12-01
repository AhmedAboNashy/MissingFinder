import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:missing_finder/Core/MyTheme/MyTheme.dart';
import 'package:missing_finder/ViewModel/Register/confirmation_code_sms.dart';

class FaceRecognition extends StatefulWidget {
  static const String routeName = 'pesonal';

  @override
  State<FaceRecognition> createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  File? _image;
  List<Face> faces = [];

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
                    height: 20.h,
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
                      height: 250.h,
                      width: 200.w,
                      color: Colors.grey,
                      child: _image == null
                          ? Center(
                              child: Icon(
                                Icons.linked_camera,
                                size: 40.sp,
                                color: Colors.black,
                              ),
                            )
                          : Image.file(_image!),
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
                              _pickImage(ImageSource.camera)
                                  //select from camera
                                  .then((value) {
                                if (_image != null) {
                                  _detectFaces(_image!);
                                 // numbrer of people
                                }
                              });
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
                              _pickImage(ImageSource.gallery).then((value) {
                                if (_image != null) {
                                  _detectFaces(_image!);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 360),
                    child: Text(
                      'The Number Of people : ${faces.length}',
                      style: TextStyle(
                          color: Color(MyTheme.textColor),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
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
                        Stack(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 37.h,
                                  width: 90.w,
                                  child: TextButton(
                                    onPressed: () {},
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
                                        MyTheme.backgroundInterface,
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
                                    onPressed: () {},
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
                                        MyTheme.backgroundInterface,
                                      ),
                                    ),
                                  ),
                                )
                              ],
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
                                  width: 55.w,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'DD',
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
                                        MyTheme.backgroundInterface,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                SizedBox(
                                  height: 35.h,
                                  width: 55.w,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'MM',
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
                                        MyTheme.backgroundInterface,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                SizedBox(
                                  height: 35.h,
                                  width: 55.w,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'yyyy',
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
                                        MyTheme.backgroundInterface,
                                      ),
                                    ),
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

  //detect  face
  // parameter img input image To get to know her
  Future _detectFaces(File img) async {
    final option = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: option);
    // now detect input user
    final inputImage = InputImage.fromFilePath(img.path);
    faces = await faceDetector.processImage(inputImage);
    //image processing
    setState(() {
      print(faces.length);
    });
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
