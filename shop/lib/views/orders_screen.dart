import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ordersProvider.itemsCount,
        itemBuilder: (context, index) {
          return OrderWidget(order: ordersProvider.items[index]);
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
