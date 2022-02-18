import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  final String category;
  final String desc;
  num price;
  num quantity;
  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    required this.category,
    required this.desc,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      imageUrl,
      isRecommended,
      isPopular,
      category,
      desc,
      price,
      quantity,
    ];
  }

  Product copyWith({
    int? id,
    String? name,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    String? category,
    String? desc,
    num? price,
    num? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      category: category ?? this.category,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'category': category,
      'desc': desc,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap['id'],
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      category: snap['category'],
      desc: snap['desc'],
      price: snap['price'],
      quantity: snap['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
        id: 1,
        category: "Veg",
        imageUrl:
            "https://media.istockphoto.com/photos/plain-dosa-dish-picture-id1318571167?b=1&k=20&m=1318571167&s=170667a&w=0&h=y6-UzyZaDysAXmkUeA9TJyxgkGRxccygadwNS_26WZM=",
        isPopular: true,
        isRecommended: false,
        name: "Masala Dhosa",
        price: 399,
        desc:
            "elit fugiat aliqua qui cillum mollit.Ex et aliqua labore sit velit consectetur ad nostrud consectetur elit et. Nisi qui occaecat enim adipisicing culpa in sunt ad. Sint exercitation dolore minim est officia.",
        quantity: 25),
    Product(
        id: 2,
        category: "NonVeg",
        imageUrl:
            "https://media.istockphoto.com/photos/image-of-indian-meal-of-homemade-nan-naan-bread-sliced-with-butter-picture-id1154928317?b=1&k=20&m=1154928317&s=170667a&w=0&h=uBNWkT1Uw6o_EQyU-SmiC9RjniM4e6M8lDnpeP86Mpg=",
        isPopular: false,
        isRecommended: true,
        name: "Chicken Tika",
        price: 249,
        quantity: 25,
        desc:
            " officia minim culpa voluptate non enim. Tempor minim aliquip ea cupidatat adipisicing minim ea deserunt."),
    Product(
        id: 3,
        category: "NonVeg",
        imageUrl:
            "https://media.istockphoto.com/photos/baked-chicken-drumsticks-picture-id964765254?k=20&m=964765254&s=612x612&w=0&h=F1jgOH__u1bxuTHe2RviILM_fM9gplwnXum3UIyLTOQ=",
        isPopular: false,
        isRecommended: true,
        name: "Chicken Sticks",
        price: 499,
        desc: "GAMING",
        quantity: 25),
    Product(
        id: 4,
        category: "Sweet",
        imageUrl:
            "https://media.istockphoto.com/photos/motichur-laddu-made-from-besan-special-festival-indain-sweets-picture-id1337187550?b=1&k=20&m=1337187550&s=170667a&w=0&h=acDhzNeuWzihuqg6zCb0UCrhFSDmcTR4wqifE3dF6Ac=",
        isRecommended: false,
        name: "Laddu",
        price: 599,
        isPopular: true,
        desc: "GAMING",
        quantity: 25),
    Product(
        id: 5,
        category: "Veg",
        imageUrl:
            "https://media.istockphoto.com/photos/indian-pulav-or-vegetables-rice-or-veg-biryani-orange-background-picture-id495201462?k=20&m=495201462&s=612x612&w=0&h=gDhrYVsBvpkf0WVbgde8kwvaM1YfFr-C2iSZuVjMsoU=",
        isPopular: true,
        isRecommended: true,
        name: " Vegetables Rice",
        price: 299,
        desc: "GAMING",
        quantity: 25),
    Product(
        id: 6,
        category: "Spicy",
        imageUrl:
            "https://media.istockphoto.com/photos/prawns-with-chimichurri-picture-id474164285?k=20&m=474164285&s=612x612&w=0&h=FcFhxNWhjqgOVSDnlaKE6sdxz_otf27Xv2RdPcUYRzQ=",
        isPopular: true,
        isRecommended: false,
        name: "Chimichurri",
        price: 399,
        desc: "GAMING",
        quantity: 25),
    Product(
        id: 7,
        category: "FastFood",
        imageUrl:
            "https://media.istockphoto.com/photos/fresh-tasty-burger-picture-id495204032?k=20&m=495204032&s=612x612&w=0&h=x44AnT8kHv-apqnG9t1ILwf2sIr4uq14CUB7MBaiuOI=",
        isPopular: false,
        isRecommended: true,
        name: " Veg Burger",
        price: 149,
        desc: "GAMING",
        quantity: 25),
  ];
}
