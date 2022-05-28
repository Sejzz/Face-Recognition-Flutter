import 'dart:convert';
import 'dart:io';
import 'package:Face_recognition/pages/detector_painters.dart';
import 'package:Face_recognition/pages/widgets/themes.dart';
import 'package:Face_recognition/pages/utils.dart';
import 'package:Face_recognition/utils/routes.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
//import 'detector_painters.dart';
//import 'utils.dart';
import 'package:image/image.dart' as imglib;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:quiver/collection.dart';
import 'package:flutter/services.dart';

class user extends StatefulWidget {
  const user({ Key? key }) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('USER'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.person),
          iconSize: 26,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: MyTheme.blue,
        elevation: 0,
      ),
      body: 
       Column(
        
        children: [Padding(padding: EdgeInsets.symmetric(horizontal: 200, vertical: 30)),
          SizedBox(height: 0.0),
          
           Container(
  height: 150.0,
  child: RaisedButton(
    onPressed: ()  => 
                    Navigator.pushNamed(context, MyRoutes.cameraRoute),
     
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.0)
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300.0, minHeight: 150.0),
        alignment: Alignment.center,
        child: 
        
        Text(
          "Scan a Face",

          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
      ),
    ),
  ),
), 
      
      
  ]
      )  );
  }
}