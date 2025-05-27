import 'package:flutter/material.dart';
import 'package:food_delivery/admin/add_food.dart';
import 'package:food_delivery/widget/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            Center(
              child: Text("Home Admin", style: AppWidget.headlineTextFieldStyle(),),
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFood()));
              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(6),
                          child: Image.asset("images/food.jpg", height: 100, width: 100, fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 30.0,),
                        Text("Add Food Items", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
