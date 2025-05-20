import 'package:flutter/material.dart';

import '../widget/widget_support.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight ,
                      colors: [
                        Color(0xFFff5c30),
                        Color(0xFFe74b1a),
                      ])),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(child: Image.asset("images/logo.png", width: MediaQuery.of(context).size.width/1.5, fit: BoxFit.cover,)),
                  SizedBox(height: 50.0,),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.6,
                      child: Column(
                        children: [
                          SizedBox(height: 30.0,),
                          Text("Signup", style: AppWidget.headlineTextFieldStyle(),),
                          SizedBox(height: 30.0,),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: AppWidget.semiBoldTextFieldStyle(),
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: AppWidget.semiBoldTextFieldStyle(),
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: AppWidget.semiBoldTextFieldStyle(),
                              prefixIcon: Icon(Icons.password_outlined),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text("Forgot Password?", style: AppWidget.semiBoldTextFieldStyle(),)),
                          SizedBox(height: 50.0,),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                width: 200,
                                decoration: BoxDecoration(color:Color(0Xffff5722), borderRadius: BorderRadius.circular(20.0)),
                                child: Center(child: Text("SIGNUP", style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold,fontSize: 18.0, fontFamily: 'Poppins1'),))
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    child: Text("Already have an account? Login", style: AppWidget.semiBoldTextFieldStyle(),))
                ],
              ),
            )
          ],
        ),
      ),
    );;
  }
}
