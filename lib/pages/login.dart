import 'dart:convert';
import 'dart:io';
import 'package:Face_recognition/pages/widgets/header.dart';
import 'package:Face_recognition/pages/widgets/themes.dart';
import 'package:Face_recognition/utils/routes.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';


class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  double headerheight = 250;
  bool changeButton = false;
  String entered_phone='';



  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
                height: headerheight,
                child: HeaderWidget(
                  headerheight,
                  
                  true,
                  "Welcome",
                )),
            SafeArea(
              child: Column(children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Column(children: [
                    
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: MyTheme.blue,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 70 : 30),
                      child: InkWell(
                        
                        onTap: ()  => 
                    Navigator.pushNamed(context, MyRoutes.login_userRoute),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 250,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "AS USER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                        
                      ),
                      
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Material( color: MyTheme.blue,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 70 : 30),
                      child: InkWell(
                        onTap: () => 
                    Navigator.pushNamed(context, MyRoutes.login_adminRoute),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 250,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "AS ADMIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                        
                      ),),

                      SizedBox(height: 40,),
                       
                Image.asset(
                  "assets/images/handcuff.png",
                  fit: BoxFit.cover,
                  height: 160,
                ),
                   
                  ]),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
