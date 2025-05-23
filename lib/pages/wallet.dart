import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery/service/database.dart';
import 'package:food_delivery/service/shared_pref.dart';
import 'package:food_delivery/widget/app_constant.dart';
import 'package:food_delivery/widget/widget_support.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  String? wallet, id;
  int? add;

  getthesharedpref()async{
    wallet = await SharedPreferenceHelper().getUserWallet();
    id = await SharedPreferenceHelper().getUserId();
    setState(() {

    });
  }

  ontheload()async{
    await getthesharedpref();
    setState(() {

    });
  }

  Map<String, dynamic>? paymentIntent;
  String selectedAmount = '100'; // Track selected amount

  @override
  void initState() {
    ontheload();
    super.initState();
    Stripe.publishableKey = publishableKey; // Make sure to set this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallet==null? CircularProgressIndicator() : Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Wallet",
                    style: AppWidget.headlineTextFieldStyle(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 40.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your wallet",
                        style: AppWidget.lightTextFieldStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      Text("\$"+wallet!, style: AppWidget.boldTextFieldStyle()),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Add money",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => setState(() => selectedAmount = '100'),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE9E2E2)),
                      borderRadius: BorderRadius.circular(5),
                      color: selectedAmount == '100' ? Colors.blue[50] : null,
                    ),
                    child: Text("\$100", style: AppWidget.semiBoldTextFieldStyle()),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedAmount = '500'),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE9E2E2)),
                      borderRadius: BorderRadius.circular(5),
                      color: selectedAmount == '500' ? Colors.blue[50] : null,
                    ),
                    child: Text("\$500", style: AppWidget.semiBoldTextFieldStyle()),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedAmount = '1000'),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE9E2E2)),
                      borderRadius: BorderRadius.circular(5),
                      color: selectedAmount == '1000' ? Colors.blue[50] : null,
                    ),
                    child: Text("\$1000", style: AppWidget.semiBoldTextFieldStyle()),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedAmount = '2000'),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE9E2E2)),
                      borderRadius: BorderRadius.circular(5),
                      color: selectedAmount == '2000' ? Colors.blue[50] : null,
                    ),
                    child: Text("\$2000", style: AppWidget.semiBoldTextFieldStyle()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => makePayment(selectedAmount),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFF008080),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Add Money",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
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

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          merchantDisplayName: 'Food Delivery',
          style: ThemeMode.light,
        ),
      );

      await displayPaymentSheet(amount);
    } catch (e, s) {
      print('Payment exception: $e $s');
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text("Payment failed: ${e.toString()}"),
        ),
      );
    }
  }

  Future<void> displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      add = int.parse(wallet!)+int.parse(amount);
      await SharedPreferenceHelper().saveUserWallet(add.toString());
      await DatabaseMethod().UpdateUserWallet(id!, add.toString());
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.check_circle, color: Colors.green, size: 50),
              SizedBox(height: 10),
              Text("Payment Successful!"),
            ],
          ),
        ),
      );
      await getthesharedpref();
    } on StripeException catch (e) {
      print("Stripe Exception: $e");
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text("Payment failed: ${e.error.localizedMessage}"),
        ),
      );
    } catch (e) {
      print("Error: $e");
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Payment cancelled"),
        ),
      );
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': calculateAmount(amount),
          'currency': currency,
          'payment_method_types[]': 'card',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create payment intent: ${response.body}');
      }
    } catch (e) {
      throw Exception('Payment error: ${e.toString()}');
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount) * 100).toString();
    return calculatedAmount;
  }
}