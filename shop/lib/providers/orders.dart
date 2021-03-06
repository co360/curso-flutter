import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/providers/cart.dart';

class Order {
  String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order({
    this.id,
    this.total,
    this.products,
    this.date,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['date'] = this.date.toIso8601String();
    data['products'] = this
        .products
        .map(
          (cartItem) => cartItem.toJson(),
        )
        .toString();
    return data;
  }
}

class OrdersProvider with ChangeNotifier {
  final baseUrl = 'https://cod3r-shop-603d1.firebaseio.com/orders';

  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addOrder(CartProvider cart) async {
    final newOrder = Order(
      total: cart.totalAmount,
      date: DateTime.now(),
      products: cart.items.values.toList(),
    );

    final id = await http
        .post("$baseUrl.json", body: json.encode(newOrder.toJson()))
        .then((value) {
      return json.decode(value.body)['name'];
    });

    newOrder.id = id;

    _items.insert(0, newOrder);
    notifyListeners();
  }
}
