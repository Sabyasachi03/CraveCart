import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 45, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height / 4.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width,
                        105,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6.5,
                    ),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Icon(Icons.person_outline, size: 120),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sabyasachi Samanta",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.black,),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                          Text("Sabyasachi Samanta", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ),
            SizedBox(height: 30,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.email, color: Colors.black,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                            Text("s1@gmail.com", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(height: 30,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.description, color: Colors.black,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Terms and Conditions", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(height: 30,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.black,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Delete Account", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(height: 30,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.black,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Log Out", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
