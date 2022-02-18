import 'package:admin/screens/orders_screen.dart';
import 'package:admin/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Admin Panel")),
        body: SizedBox(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: double.infinity,
                height: 150,
                child: InkWell(
                    onTap: () {
                      Get.to(() => ProductScreen());
                    },
                    child: const Card(
                        child: Center(child: Text("Goto Products")))),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: double.infinity,
                height: 150,
                child: InkWell(
                    onTap: () {
                      Get.to(() =>  OrdersScreen());
                    },
                    child:
                        const Card(child: Center(child: Text("Goto Orders")))),
              )
            ],
          ),
        ));
  }
}
