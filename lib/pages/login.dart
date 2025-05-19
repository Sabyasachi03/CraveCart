import 'package:flutter/material.dart';
import 'package:food_delivery/widget/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      height: MediaQuery.of(context).size.height/2,
                      child: Column(
                        children: [
                          SizedBox(height: 30.0,),
                          Text("Login", style: AppWidget.headlineTextFieldStyle(),),
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
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: AppWidget.semiBoldTextFieldStyle(),
                              prefixIcon: Icon(Icons.password_outlined),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            alignment: Alignment.topRight,
                            child: Text("Forgot Password?", style: AppWidget.semiBoldTextFieldStyle(),))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
