import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .set(userInfoMap);
  }

  UpdateUserWallet(String id, String amount) async {
    return await FirebaseFirestore.instance.collection("user").doc(id).update({
      "Wallet": amount,
    });
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFoodToCart(Map<String, dynamic> userInfoMap, String id) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection("cart")
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(id)
        .collection("cart")
        .snapshots();
  }

  Future<void> clearCart(String userId) async {
    final cartRef = FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('cart');

    final snapshot = await cartRef.get();
    final batch = FirebaseFirestore.instance.batch();

    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }

  // CORRECTED deleteCartItem method
  Future<void> deleteCartItem(String userId, String docId) async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(userId)
        .collection("cart")
        .doc(docId)
        .delete();
  }

  Stream getAllFoodItems() {
    return FirebaseFirestore.instance
        .collection("FoodItems")
        .snapshots();
  }
}