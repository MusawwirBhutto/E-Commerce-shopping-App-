import 'package:catalog_app/models/cartmodel.dart';
import 'package:flutter/material.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Cart'))),
      body: Column(
        children: [Expanded(child: CartList()), Divider(), CartTotal()],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total:  \$999',
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
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

final _cart = CartModel();

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
          title: Text(product?.name ?? 'Unknown'),
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
              setState(() {
                if (product != null) _cart.remove(product);
              });
            },
          ),
        );
      },
    );
  }
}
