import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/service/database.dart';
import 'package:food_delivery/service/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/widget_support.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id;
  String wallet = "0"; // Initialize with default value
  Stream? foodStream;
  int total = 0;

  // Get user data from shared preferences
  Future<void> getSharedPref() async {
    id = await SharedPreferenceHelper().getUserId();
    final walletValue = await SharedPreferenceHelper().getUserWallet() ?? "0";
    setState(() {
      wallet = walletValue;
    });
  }

  // Load data on initialization
  Future<void> onTheLoad() async {
    await getSharedPref();
    if (id != null) {
      foodStream = await DatabaseMethod().getFoodCart(id!);
    }
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  // Build food cart items
  Widget foodCart() {
    return StreamBuilder(
      stream: foodStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("Your cart is empty"));
        }

        // Calculate total ONLY ONCE per data change
        int calculatedTotal = 0;
        for (var doc in snapshot.data!.docs) {
          calculatedTotal += int.parse(doc["Total"]);
        }

        // Update total only if it's changed
        if (calculatedTotal != total) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              total = calculatedTotal;
            });
          });
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            return Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        height: 90,
                        width: 30,
                        child: Text(ds["Quantity"]),
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.fastfood_rounded, size: 70),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ds["Name"], style: AppWidget.semiBoldTextFieldStyle()),
                          Text("\$${ds["Total"]}", style: AppWidget.semiBoldTextFieldStyle())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Handle checkout process
  Future<void> checkout() async {
    if (int.parse(wallet) < total) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Insufficient wallet balance"))
      );
      return;
    }

    final newBalance = (int.parse(wallet) - total).toString();

    await DatabaseMethod().UpdateUserWallet(id!, newBalance);
    await DatabaseMethod().clearCart(id!); // Clear cart after purchase
    await SharedPreferenceHelper().saveUserWallet(newBalance);

    setState(() {
      wallet = newBalance;
      total = 0; // Reset cart total
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Purchase successful! Remaining balance: \$$newBalance"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
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
            const SizedBox(height: 20),
            Expanded(
              flex: 5,
              child: foodCart(),
            ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price", style: AppWidget.boldTextFieldStyle()),
                  Text("\$$total", style: AppWidget.semiBoldTextFieldStyle()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Wallet Balance", style: AppWidget.boldTextFieldStyle()),
                  Text("\$$wallet", style: AppWidget.semiBoldTextFieldStyle()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: checkout,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: const Center(
                  child: Text(
                    "CheckOut",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
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