import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/pages/order.dart';
import 'package:food_delivery/pages/profile.dart';
import 'package:food_delivery/pages/wallet.dart';

import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late Wallet wallet;
  late Profile profile;
  late Order order;

  @override
  void initState() {
    homePage = Home();
    wallet = Wallet();
    profile = Profile();
    order = Order();
    pages = [homePage, order, wallet, profile];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 56,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: Duration(milliseconds: 400),
          onTap: (int index){
            setState(() {
              currentTabIndex = index;
            });
          },
          items:
      [
        Icon(Icons.home_outlined, color: Colors.white),
        Icon(Icons.shopping_bag_outlined, color: Colors.white),
        Icon(Icons.wallet_outlined, color: Colors.white),
        Icon(Icons.person_outline, color: Colors.white),
      ]
      ),
      body: pages[currentTabIndex],
    );
  }
}
