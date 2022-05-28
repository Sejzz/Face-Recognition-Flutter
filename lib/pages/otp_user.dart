import 'package:Face_recognition/pages/widgets/themes.dart';
import 'package:Face_recognition/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';


class otp extends StatefulWidget {
   var confirmationResult;
  var phone;

  otp({this.confirmationResult,this.phone});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
 //  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController phoneController = TextEditingController(text: "+923028997122");

  TextEditingController otpController = TextEditingController();

    String verificationIDReceived = "";

    bool otpCodeVisible = false;

  late String enteredOTP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              
              SizedBox(
                height: 18,
              ),
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
               
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter the OTP sent to +91 ${widget.phone}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 1,
              ),



              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                
                  borderRadius: BorderRadius.circular(5),
                  
                   
                ),
                child: Column(
                  children: [
                    
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            PinInputTextField(
              decoration: BoxLooseDecoration(strokeColorBuilder: 
              PinListenColorBuilder(MyTheme.blue, MyTheme.blue)),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly], 
              onChanged: (value){
                enteredOTP=value;
              },
              //showFieldAsBox: true,
              onSubmit: (String pin){
              //TODO: add on submit
              }, // end onSubmit
            ), 
            // end PinEntryTextField()
          ), // end Padding()
        ),  
      

SizedBox(
  height: 40,
),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => 
                    Navigator.pushNamed(context, MyRoutes.userRoute),

                           // await FirebaseService().authenticateMe(confirmationResult, enteredOTP,context);

                        
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(MyTheme.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                           //   focusedBorder: OutlineInputBorder(
                           // borderSide: BorderSide(color: MyTheme.orange2)),
                            ),
                         ),
                        ),
                        
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),

              Text(
                "Incorrect phone number?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              TextButton(onPressed: (){Navigator.popAndPushNamed(context,MyRoutes.loginRoute);}, child: Text(
                "Enter new number",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blue,
                ),
                textAlign: TextAlign.center,
              ),)
            ],
          ),
        ),
      ),
    ); 
  }

  void verifyOTP() async {

   // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIDReceived, smsCode: otpController.text);

   // await auth.signInWithCredential(credential).then((value){
      print("You are logged in successfully");
   //   Fluttertoast.showToast(
      //    msg: "You are logged in successfully",
      //    toastLength: Toast.LENGTH_SHORT,
        //  gravity: ToastGravity.CENTER,
       //   timeInSecForIosWeb: 1,
        //  backgroundColor: Colors.red,
       //   textColor: Colors.white,
       //   fontSize: 16.0
      
   // }
   // );
  }
}