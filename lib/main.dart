import 'package:admin/screens/home_screen.dart';
import 'package:admin/screens/new_product_screen.dart';
import 'package:admin/screens/orders_screen.dart';
import 'package:admin/screens/products_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Admin Panel",
      home: const HomeScreen(),
      getPages: [
        GetPage(name: "/products", page: () => ProductScreen()),
        GetPage(name: "/products/new", page: () => NewProductScreen()),
        GetPage(name: "/orders", page: () =>  OrdersScreen())
      ],
    );
  }
}
