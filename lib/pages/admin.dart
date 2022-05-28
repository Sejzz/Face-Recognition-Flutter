import 'package:Face_recognition/pages/widgets/themes.dart';
import 'package:Face_recognition/utils/routes.dart';
import 'package:flutter/material.dart';

class admin extends StatefulWidget {
  const admin({ Key? key }) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
   bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ADMIN'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.person), iconSize: 26,),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: MyTheme.blue4,
        elevation: 0,
      ),
      body: Column(
        
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
                    SizedBox(height: 60.0),
          
            Container(
  height: 150.0,
  child: RaisedButton(
    onPressed: () {},
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
          "Enter Criminal Details",

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
         ],
      ),
    );
  }
}