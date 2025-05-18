import 'package:flutter/material.dart';
import 'package:food_delivery/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_outlined, color: Colors.black),
            ),
            Image.asset(
              "images/salad2.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.3  ,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15.0,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Indian", style: AppWidget.semiBoldTextFieldStyle(),),
                    Text("Chichpea Salad", style: AppWidget.headlineTextFieldStyle(),),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    if(a>1){
                      --a;
                    }
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.remove, color: Colors.white,),
                  ),
                ),
                SizedBox(width: 15.0,),
                Text(a.toString(), style: AppWidget.semiBoldTextFieldStyle(),),
                SizedBox(width: 15.0,),
                GestureDetector(
                  onTap:(){
                    ++a;
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Text("Lorem Ipsome... nionsdids iondindsioc ionvondviosdn ioauisdo aodnn diondsd iadios ihduv  nundson sods huo", style: AppWidget.lightTextFieldStyle(), maxLines: 2,),
            SizedBox(height: 20.0,),
            Row(
              children: [
                Text("Delivery Time", style: AppWidget.semiBoldTextFieldStyle(),),
                SizedBox(width: 25,),
                Icon(Icons.alarm, color: Colors.black54,),
                SizedBox(width: 5.0,),
                Text("30 min", style: AppWidget.semiBoldTextFieldStyle(),),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: AppWidget.semiBoldTextFieldStyle(),),
                      Text("\$24", style: AppWidget.headlineTextFieldStyle(),)
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Add to cart", style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'Poppins'),),
                        SizedBox(width: 30.0,),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.all(3),
                          child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                        ),
                        SizedBox(width: 10.0,)
                      ],
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
