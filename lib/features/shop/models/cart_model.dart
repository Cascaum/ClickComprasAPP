import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  String id;
  String name;
  double price;
  int quantity;

  CartItemModel({required this.id, required this.name, required this.price, required this.quantity});

  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Price': price,
      'Quantity': quantity,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> data) {
    return CartItemModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      price: (data['Price'] ?? 0).toDouble(),
      quantity: data['Quantity'] ?? 0,
    );
  }

  factory CartItemModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CartItemModel(
      id: document.id,
      name: data['Name'] ?? '',
      price: (data['Price'] ?? 0).toDouble(),
      quantity: data['Quantity'] ?? 0,
    );
  }
}

class CartModel {
  String id;
  List<CartItemModel> items;

  CartModel({required this.id, required this.items});

  static CartModel empty() => CartModel(id: '', items: []);

  toJson() {
    return {
      'Id': id,
      'Items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> data) {
    return CartModel(
      id: data['Id'] ?? '',
      items: (data['Items'] as List<dynamic>? ?? [])
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  factory CartModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CartModel(
        id: document.id,
        items: (data['Items'] as List<dynamic>? ?? [])
            .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } else {
      return CartModel.empty();
    }
  }

  static double calculateCartTotal(CartModel cart) {
    return cart.items
        .map((item) => item.price * item.quantity)
        .fold(0.0, (previousTotal, currentItemTotal) => previousTotal + currentItemTotal);
  }
}
