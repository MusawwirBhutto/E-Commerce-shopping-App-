import 'package:catalog_app/models/cartmodel.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class HomepageProductsDetails extends StatelessWidget {
  final Products product;
  const HomepageProductsDetails({super.key, required this.product});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: product.img,
        
                child: Container(
                  height: 300,
                  width: 300,
        
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Image.network(product.img, fit: BoxFit.contain),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              product.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(product.desc, style: TextStyle(fontSize: 15)),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: SizedBox(
                height: 168,
                child: Text(
                  'lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      final cart = CartModel();
                      cart.catalog = CatalogModel(); // Ensure catalog is set
                      cart.add(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} added to cart!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
        
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
