import 'package:admin/models/product_model.dart';
import 'package:admin/services/database_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final DatabaseService database = DatabaseService();
  var products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(database.getProducts());
    super.onInit();
  }

  var newProduct = {}.obs;
  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isPopular => newProduct['isPopular'];
  get isRecommended => newProduct['isRecommended'];

  void updateProductPrice(int index, Product product, num value) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(int index, Product product, num value) {
    product.quantity = value;
    products[index] = product;
  }

  void saveNewProductPrice(Product product, String field, num value) {
     database.updateField(product, field, value);
  }
   void saveNewProductQuantity(Product product, String field, num value) {
     database.updateField(product, field, value);
  }
}
