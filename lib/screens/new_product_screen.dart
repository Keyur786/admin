import 'package:admin/controller/product_controller.dart';
import 'package:admin/models/product_model.dart';
import 'package:admin/services/database_services.dart';
import 'package:admin/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.find();
  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Add Products"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => Column(children: [
              SizedBox(
                height: 100,
                child: Card(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            ImagePicker _picker = ImagePicker();
                            final XFile? _image = await _picker.pickImage(
                                source: ImageSource.gallery);

                            if (_image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("No image was Selected")));
                            }
                            if (_image != null) {
                              await storage.uploadImage(_image);
                              var imageUrl =
                                  await storage.getDownloadUrl(_image.name);
                              productController.newProduct.update(
                                  'imageUrl', (_) => imageUrl,
                                  ifAbsent: () => imageUrl);
                            }
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.black,
                          )),
                      const Text(
                        "Add an Image",
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
              const SizedBox(height: 20),
              const Text(
                " Product Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              _buildTextFormField("Product ID", "id", productController),
              _buildTextFormField("Product Name", "name", productController),
              _buildTextFormField(
                  "Product Description", "desc", productController),
              _buildTextFormField(
                  "Product Category", "category", productController),
              const SizedBox(height: 20),
              _buildSlider(
                  "Price", "price", productController, productController.price),
              _buildSlider("Qty", "quantity", productController,
                  productController.quantity),
              const SizedBox(height: 20),
              _buildCheckbox("Recommended", "isRecommended", productController,
                  productController.isRecommended),
              _buildCheckbox("Popular", "isPopular", productController,
                  productController.isPopular),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    database.addproduct(Product(
                        id: int.parse(productController.newProduct['id']),
                        name: productController.newProduct['name'],
                        imageUrl: productController.newProduct['imageUrl'],
                        isRecommended:
                            productController.newProduct['isRecommended'],
                        isPopular: productController.newProduct['isPopular'],
                        category: productController.newProduct['category'],
                        desc: productController.newProduct['desc'],
                        price: productController.newProduct['price'],
                        quantity:
                            productController.newProduct['quantity']));
                  },
                  child: const Text("Save")),
            ]),
          ),
        ));
  }

  Row _buildCheckbox(String title, String name,
      ProductController productController, bool? controllerValue) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Checkbox(
            value: (controllerValue == null) ? false : controllerValue,
            onChanged: (value) {
              productController.newProduct
                  .update(name, (_) => value, ifAbsent: () => value);
            }),
      ],
    );
  }

  Row _buildSlider(String title, String name,
      ProductController productController, double? controllerValue) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Slider(
              value: (controllerValue == null) ? 0 : controllerValue,
              min: 0,
              max: 1000,
              divisions: 10,
              onChanged: (value) {
                productController.newProduct
                    .update(name, (_) => value, ifAbsent: () => value);
              }),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
      String hintText, String name, ProductController productController) {
    return TextFormField(
        decoration: InputDecoration(hintText: hintText),
        onChanged: (value) {
          productController.newProduct
              .update(name, (_) => value, ifAbsent: () => value);
        });
  }
}
