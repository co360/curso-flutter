import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      'R\$${cartProvider.totalAmount}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {

                    },
                    child: Text("COMPRAR"),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}