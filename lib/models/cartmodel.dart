import 'package:catalog_app/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  // Singleton implementation
  static final CartModel _instance = CartModel._internal();

  factory CartModel() {
    return _instance;
  }

  CartModel._internal();

  List<int> productIds = [];

  CatalogModel get catalog => _catalog;

  // now this is a list, it will have all the products with variables like name, id , price etc which have been selected or added into cart, how?
  //productIds the upper list will have all the ids of product which have been added into this list and this lower list will convert
  //map using inside a method created in catalog.dart 'getbyID' which gets the product by inserting id so which ever id will be given it will bring that
  // product and will convert those products into list and will save it in the proucts list
  List<Products?> get products =>
      productIds.map((id) => CatalogModel.getbyID(id)).toList();

  // Add a setter to set the catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  num get totalPrice =>
      products.fold(0, (total, current) => total + (current?.price ?? 0));
  void add(Products item) {
    productIds.add(item.id);
  }

  void remove(Products item) {
    productIds.remove(item.id);
  }
}
