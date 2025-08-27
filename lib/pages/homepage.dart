import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/homepage_products_details.dart';
import 'package:catalog_app/utilis/routes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catalog_app/providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Products> productsList = []; //  This holds final data

  @override
  void initState() {
    super.initState();
    loadData(); //  Call loadData once when screen starts
  }

  Future loadData() async {
    await Future.delayed(Duration(seconds: 1));
    var catalogjson = await rootBundle.loadString('assets/catalog.json');
    var decodedjson = jsonDecode(catalogjson);
    var productdata = decodedjson['products'];

    /*It’s like: the list I have got is productData, and inside that list are maps. That’s why we use productData.map.
    The <Products> part shows that it will return a list containing only Products objects.

    Inside that function, (a) takes a single map — let's say the one at index 0 — and sends it to Products.fromJson(a), which creates a Products object for the 0th index.

    Similarly, it processes the map at index 1, then index 2, and so on.
    In the end, all the Products objects that have been created are collected into a list, and that list is stored in productList, right? */

    setState(() {
      productsList =
          productdata.map<Products>((a) => Products.fromjson(a)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            heroTag: 'theme_toggle_btn',
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: CircleBorder(),
            child: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartroute);
            },
            shape: CircleBorder(),
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            CatalogHeader(),
            SizedBox(height: 30),
            Expanded(child: CatalogProducts(productsList: productsList)),
          ],
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catalog App',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Text(
          'Trending Products',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class CatalogProducts extends StatelessWidget {
  final List<Products> productsList;
  const CatalogProducts({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    if (productsList.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          final product = productsList[index];
          return InkWell(
            child: ProductCard(product: product),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => HomepageProductsDetails(product: product),
                ),
              );
            },
          );
        },
      );
    }
  }
}

class ProductCard extends StatelessWidget {
  final Products product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardTheme.color,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      elevation: 0.7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: product.img,
              child: SizedBox(
                width: 130,
                height: 130,

                child: Image.network(product.img, fit: BoxFit.contain),
              ),
            ),

            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    product.desc,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(fontSize: 17),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
