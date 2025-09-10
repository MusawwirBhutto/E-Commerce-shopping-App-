import 'package:catalog_app/models/cartmodel.dart';
import 'package:flutter/material.dart';

final _cart = CartModel();

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  void _updateCart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final int total = _cart.totalPrice.toInt();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Cart'))),
      body: Column(
        children: [
          Expanded(child: CartList(onCartChanged: _updateCart)),
          Divider(),
          CartTotal(total: total),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key, required this.total});
  final int total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total: \$$total',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 35,
            width: 140,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Buying is not supported yet.'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Text(
                'Buy',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key, required this.onCartChanged});
  final VoidCallback onCartChanged;
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    if (_cart.products.isEmpty) {
      return Center(
        child: Text(
          'Cart is empty',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
    return ListView.builder(
      itemCount: _cart.productIds.length,
      itemBuilder: (context, index) {
        final product = _cart.products[index];
        return ListTile(
          title: Text(
            product?.name ?? 'Unknown',
            style: TextStyle(fontSize: 20),
          ),
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
              setState(() {
                if (product != null) _cart.remove(product);
              });
              widget.onCartChanged();
            },
          ),
        );
      },
    );
  }
}
