import 'package:flutter/material.dart';

import '../widget/widget_support.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Food Cart",
                    style: AppWidget.headlineTextFieldStyle(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        child: Center(child: Text("2")),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        height: 90,
                        width: 30,
                      ),
                      SizedBox(width: 20,),
                      Icon(Icons.fastfood_rounded, size: 70,),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text("Pizza", style: AppWidget.semiBoldTextFieldStyle(),),
                          Text("\$40", style: AppWidget.semiBoldTextFieldStyle(),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price", style: AppWidget.boldTextFieldStyle(),),
                  Text("\$40.0", style: AppWidget.semiBoldTextFieldStyle(),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.only(right: 20,left: 20,bottom: 20),
              child: Center(child: Text("CheckOut", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}
