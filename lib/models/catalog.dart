class Products {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String img;

  Products({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.img,
  });

  // now what this factory constructor here is doing actually is, it is taking values from json all name,desc,price etc and putting it into directly products class which means you do not need to pas arguments like id,name while creating obj of class products it will directly give you objects of products like lets say obj1,obj2 or product 1,product 2...
  factory Products.fromjson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      price: json['price'],
      color: json['color'],
      img: json['image'],
    );
  }
}
