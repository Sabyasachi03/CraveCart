import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/details.dart';

import '../widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream=false, pizza=false, salad=false, burger=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello Sabyasachi,",
                  style: AppWidget.boldTextFieldStyle(),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.shopping_cart, color: Colors.white,),
                )
              ],
            ),
            SizedBox(height: 40.0,),
            Text(
              "Delicious Food",
              style: AppWidget.headlineTextFieldStyle(),
            ),
            Text(
              "Discover and Get Great Food",
              style: AppWidget.lightTextFieldStyle(),
            ),
            SizedBox(height: 20.0,),
            Container(
              margin: EdgeInsets.only(right: 20),
                child: showItem()),
            SizedBox(height: 20.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("images/salad2.png",height: 150,width: 150,fit: BoxFit.cover,),
                              Text("Veggie Taco", style: AppWidget.semiBoldTextFieldStyle(),),
                              SizedBox(height: 5.0,),
                              Text("Fresh and Healthy", style: AppWidget.lightTextFieldStyle(),),
                              SizedBox(height: 5.0,),
                              Text("\$25", style: AppWidget.semiBoldTextFieldStyle(), )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    margin: EdgeInsets.all(4.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/salad3.png",height: 150,width: 150,fit: BoxFit.cover,),
                            Text("Mixed Veg Salad", style: AppWidget.semiBoldTextFieldStyle(),),
                            SizedBox(height: 5.0,),
                            Text("Spicy with onion", style: AppWidget.lightTextFieldStyle(),),
                            SizedBox(height: 5.0,),
                            Text("\$30", style: AppWidget.semiBoldTextFieldStyle(), )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("images/salad2.png",height: 120,width: 120,),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Container(
                            child: Text("Indian Chickpea Salad", style: AppWidget.semiBoldTextFieldStyle(),),
                            width: MediaQuery.of(context).size.width/2
                          ),
                          SizedBox(height: 5.0),
                          Container(
                              child: Text("Honey goot Cheese", style: AppWidget.lightTextFieldStyle(),),
                              width: MediaQuery.of(context).size.width/2
                          ),
                          SizedBox(height: 5.0),
                          Container(
                              child: Text("\$24", style: AppWidget.semiBoldTextFieldStyle(),),
                              width: MediaQuery.of(context).size.width/2
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget showItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            icecream=true;
            pizza=false;
            burger=false;
            salad=false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: icecream? Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/ice-cream.png",height: 40,width: 40,fit: BoxFit.cover,color: icecream?Colors.white:Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream=false;
            pizza=true;
            burger=false;
            salad=false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: pizza? Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/pizza.png",height: 40,width: 40,fit: BoxFit.cover,color: pizza?Colors.white:Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream=false;
            pizza=false;
            burger=false;
            salad=true;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: salad? Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/salad.png",height: 40,width: 40,fit: BoxFit.cover,color: salad?Colors.white:Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream=false;
            pizza=false;
            burger=true;
            salad=false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: burger? Colors.black: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/pizza.png",height: 40,width: 40,fit: BoxFit.cover,color: burger?Colors.white:Colors.black,),
            ),
          ),
        ),
      ],
    );
  }
}
