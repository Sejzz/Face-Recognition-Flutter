import 'dart:convert';
import 'dart:io';
import 'package:Face_recognition/pages/admin.dart';
import 'package:Face_recognition/pages/login.dart';
import 'package:Face_recognition/pages/login_admin.dart';
import 'package:Face_recognition/pages/login_user.dart';
import 'package:Face_recognition/pages/otp_user.dart';
import 'package:Face_recognition/pages/user.dart';
import 'package:Face_recognition/utils/routes.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'detector_painters.dart';
import 'utils.dart';
import 'package:image/image.dart' as imglib;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:quiver/collection.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.light,
    theme: ThemeData(brightness: Brightness.light),
   // home: _MyHomePage(),
   
    debugShowCheckedModeBanner: false,
routes: {
          "/": (context) => loginPage(),
          MyRoutes.loginRoute: (context) => loginPage(),
          MyRoutes.userRoute: (context) => user(),
          MyRoutes.adminRoute: (context) => admin(),
          MyRoutes.login_userRoute: (context) => login_user(),
          MyRoutes.login_adminRoute: (context) => login_admin(),
          MyRoutes.otp_userRoute: (context) => otp()
        }

  ));
}

