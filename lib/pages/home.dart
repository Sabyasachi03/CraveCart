import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/details.dart';
import 'package:food_delivery/service/database.dart';
import '../widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  Stream? fooditemStream;
  String selectedCategory = "Pizza";

  // Map category names to asset images
  final Map<String, String> categoryImages = {
    "Ice-cream": "images/icecream_color.png",
    "Pizza": "images/pizza_color.png",
    "Salad": "images/salad_color.png",
    "Burger": "images/burger_color.png",
  };

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    pizza = true;
    selectedCategory = "Pizza";
    fooditemStream = await DatabaseMethod().getFoodItem(selectedCategory);
    setState(() {});
  }

  Widget allItems() {
    return StreamBuilder(
      stream: fooditemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return const Center(child: Text("No items found"));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      name: ds["Name"],
                      detail: ds["Details"],
                      price: ds["Price"],
                      image: categoryImages[selectedCategory]!,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20.0, bottom: 15.0, left: 2.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Use local asset image based on category
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            categoryImages[selectedCategory]!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ds["Name"],
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                ds["Details"] ?? "Delicious food item",
                                style: AppWidget.lightTextFieldStyle(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "\$${ds["Price"]}",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.shopping_cart, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              "Delicious Food",
              style: AppWidget.headlineTextFieldStyle(),
            ),
            Text(
              "Discover and Get Great Food",
              style: AppWidget.lightTextFieldStyle(),
            ),
            const SizedBox(height: 20.0),
            showItem(),
            const SizedBox(height: 20.0),
            Expanded(
              child: allItems(),
            ),
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 100, // Increased height to prevent overflow
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryButton(
              "Ice-cream",
              "images/ice-cream.png",
              icecream,
                  () async {
                setState(() {
                  icecream = true;
                  pizza = false;
                  burger = false;
                  salad = false;
                  selectedCategory = "Ice-cream";
                });
                fooditemStream = await DatabaseMethod().getFoodItem("Ice-cream");
              }
          ),
          _buildCategoryButton(
              "Pizza",
              "images/pizza.png",
              pizza,
                  () async {
                setState(() {
                  icecream = false;
                  pizza = true;
                  burger = false;
                  salad = false;
                  selectedCategory = "Pizza";
                });
                fooditemStream = await DatabaseMethod().getFoodItem("Pizza");
              }
          ),
          _buildCategoryButton(
              "Salad",
              "images/salad.png",
              salad,
                  () async {
                setState(() {
                  icecream = false;
                  pizza = false;
                  burger = false;
                  salad = true;
                  selectedCategory = "Salad";
                });
                fooditemStream = await DatabaseMethod().getFoodItem("Salad");
              }
          ),
          _buildCategoryButton(
              "Burger",
              "images/burger.png",
              burger,
                  () async {
                setState(() {
                  icecream = false;
                  pizza = false;
                  burger = true;
                  salad = false;
                  selectedCategory = "Burger";
                });
                fooditemStream = await DatabaseMethod().getFoodItem("Burger");
              }
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String name, String asset, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70, // Fixed width for consistent spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  asset,
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontSize: 12, // Smaller font size
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.grey,
              ),
              textAlign: TextAlign.center,
              maxLines: 2, // Allow text to wrap to 2 lines
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}