import 'package:admin/controller/product_controller.dart';
import 'package:admin/models/product_model.dart';
import 'package:admin/screens/new_product_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(() => NewProductScreen());
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.black,
                        )),
                    const Text(
                      "Add New Products",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                margin: EdgeInsets.zero,
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 270,
                      child: ProductCard(
                        product: productController.products[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  const ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  product.desc,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CachedNetworkImage(
                      imageUrl: product.imageUrl, fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text("Price",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: 170,
                            child: Slider(
                              value: product.price.toDouble(),
                              min: 0,
                              max: 1000,
                              divisions: 500,
                              onChanged: (value) {
                                productController.updateProductPrice(
                                    index, product, value.toDouble());
                              },
                              onChangeEnd: (value) {
                                productController.saveNewProductPrice(
                                    product, 'price', value.toDouble());
                              },
                            ),
                          ),
                          Text("₹${product.price.toStringAsFixed(0)}",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text("Qty",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: 170,
                            child: Slider(
                                value: product.quantity.toDouble(),
                                min: 0,
                                max: 1000,
                                divisions: 1000,
                                onChanged: (value) {
                                  productController.updateProductQuantity(
                                      index, product, value.toInt());
                                },
                                onChangeEnd: (value) {
                                  productController.saveNewProductQuantity(
                                      product, 'quantity', value.toInt());
                                }),
                          ),
                          Text("${product.quantity}",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
