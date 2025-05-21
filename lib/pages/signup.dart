import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/bottom_nav.dart';

import '../widget/widget_support.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = "", password = "", name = "";

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          (SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            ),
          )),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            (SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password provided is too weak",
                style: TextStyle(fontSize: 18.0),
              ),
            )),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            (SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account already exist",
                style: TextStyle(fontSize: 18.0),
              ),
            )),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Text(""),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.6,
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(height: 30.0),
                              Text(
                                "Signup",
                                style: AppWidget.headlineTextFieldStyle(),
                              ),
                              SizedBox(height: 30.0),
                              TextFormField(
                                controller: namecontroller,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return "please enter name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.person_outline),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              TextFormField(
                                controller: emailcontroller,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return "please enter email";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              TextFormField(
                                controller: passwordcontroller,
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return "please enter password";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.password_outlined),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Forgot Password?",
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                              ),
                              SizedBox(height: 50.0),
                              GestureDetector(
                                onTap: ()async{
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email = emailcontroller.text;
                                      name = namecontroller.text;
                                      password = passwordcontroller.text;
                                    });
                                  }
                                  registration();
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0Xffff5722),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "SIGNUP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          fontFamily: 'Poppins1',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
