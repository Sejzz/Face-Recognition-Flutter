import 'package:Face_recognition/pages/widgets/header.dart';
import 'package:Face_recognition/pages/widgets/themes.dart';
import 'package:Face_recognition/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class login_user extends StatefulWidget {
  const login_user({Key? key}) : super(key: key);

  @override
  State<login_user> createState() => _login_userState();
}

class _login_userState extends State<login_user> {
  double headerheight = 250;
  bool changeButton = false;
  String entered_phone = '';
  TextEditingController _controller = TextEditingController();

TextEditingController phoneController = TextEditingController(text: "+923028997122");
   TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDReceived = "";
  bool otpVisibility = false;
String verificationID = "";
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
                  "User Login",
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
                      controller: phoneController,
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
                     Visibility(child: TextField(
              controller: otpController,
              decoration: InputDecoration(),
              keyboardType: TextInputType.number,
            ),visible: otpVisibility,),
                    SizedBox(
                      height: 30.0,
                    ),
                      ElevatedButton(
                onPressed: () {
                  if(otpVisibility){
                    verifyOTP();
                  }
                  else {
                    verifyNumber();
                  }
                },
                child: Text(otpVisibility ? "Verify" : "Login")),
                    Material(
                      color: MyTheme.blue,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 70 : 30),
                      child: InkWell(
                        onTap: ()  => 
                    Navigator.pushNamed(context, MyRoutes.userRoute),
                     //   {
                        //  Navigator.of(context).push(MaterialPageRoute(
                       //       builder: (context) => otp(_controller.text)));
                      //  },
                        //   =>
                        //  Navigator.pushNamed(context, MyRoutes.otp_userRoute),
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
                                  "Generate OTP",
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

    void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then(((value) {
            print("You are logged in successfully");
          }));
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
           otpVisibility = true;
          verificationIDReceived = verificationID;
           setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationID) {

        });
  }

  void verifyOTP() async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value){
      print("You are logged in successfully");
    //  // Fluttertoast.showToast(
    //       msg: "You are logged in successfully",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0
     // );
    });
  }
}