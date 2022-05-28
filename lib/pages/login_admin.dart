import 'package:Face_recognition/pages/widgets/header.dart';
import 'package:Face_recognition/pages/widgets/themes.dart';
import 'package:Face_recognition/utils/routes.dart';
import 'package:flutter/material.dart';

class login_admin extends StatefulWidget {
  const login_admin({ Key? key }) : super(key: key);

  @override
  State<login_admin> createState() => _login_adminState();
}

class _login_adminState extends State<login_admin> {
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
                  "Admin Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                    //  inputFormatters: <TextInputFormatter>[
                    //    FilteringTextInputFormatter.digitsOnly
                    //  ],
                      cursorColor: MyTheme.blue4,
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                            labelText: "Mobile Number",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile Number can not be empty";
                        } else if (value.length <= 9) {
                          return "Mobile Number should be atleast 10 digits";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          entered_phone = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Material(
                      color: MyTheme.blue,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 70 : 30),
                      child: InkWell(
                        onTap: () => 
                    Navigator.pushNamed(context, MyRoutes.adminRoute),
                          //TODO: add send OTP functionality
                       /*   var userExists=await FirebaseService().verifyUserExistence(entered_phone);
                          if(userExists){
                            var temp =
                            await FirebaseService().sendOTP(entered_phone,context);
                            moveToOTP(context: context, confirmationResult: temp);
                          }else{
                            FlutterToastService().showToast('You are not authorized to use this app');
                          } */

                        
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75.0,
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