import 'dart:ffi';

import 'package:admin/models/order_model.dart';
import 'package:admin/services/database_services.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  DatabaseService database = DatabaseService();

  var orders = <Order>[].obs;
  var pendingOrders = <Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOrders.bindStream(database.getPendingOrders());
    super.onInit();
  }

  void updateOrder(Order order, String field, bool value) {
    database.updateOrder(order, field, value);
  }
}
