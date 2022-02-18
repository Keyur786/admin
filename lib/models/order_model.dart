import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int customerId;
  final List<int> productIds;
  final num deliveryFee;
  final num subtotal;
  final num total;
  final bool isDelivered;
  final bool isAccepted;
  final bool isCancelled;
  final DateTime createdAt;
  const Order(
      {required this.id,
      required this.customerId,
      required this.productIds,
      required this.deliveryFee,
      required this.subtotal,
      required this.total,
      required this.isDelivered,
      required this.isAccepted,
      required this.createdAt,
      required this.isCancelled});

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productIds,
      deliveryFee,
      subtotal,
      total,
      isDelivered,
      isAccepted,
      createdAt,
      isCancelled
    ];
  }

  Order copyWith(
      {int? id,
      int? customerId,
      List<int>? productIds,
      num? deliveryFee,
      num? subtotal,
      num? total,
      bool? isDelivered,
      bool? isAccepted,
      DateTime? createdAt,
      bool? isCancelled}) {
    return Order(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        productIds: productIds ?? this.productIds,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        subtotal: subtotal ?? this.subtotal,
        total: total ?? this.total,
        isDelivered: isDelivered ?? this.isDelivered,
        isAccepted: isAccepted ?? this.isAccepted,
        createdAt: createdAt ?? this.createdAt,
        isCancelled: isCancelled ?? this.isCancelled);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'productIds': productIds,
      'deliveryFee': deliveryFee,
      'subtotal': subtotal,
      'total': total,
      'isDelivered': isDelivered,
      'isAccepted': isAccepted,
      'isCancelled': isCancelled,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
      id: snap['id'],
      customerId: snap['customerId'],
      productIds: List<int>.from(snap['productIds']),
      deliveryFee: snap['deliveryFee'],
      subtotal: snap['subtotal'],
      total: snap['total'],
      isDelivered: snap['isDelivered'],
      isAccepted: snap['isAccepted'],
      isCancelled: snap['isCancelled'],
      createdAt: snap['createdAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());
  @override
  bool get stringify => true;

  static List<Order> orders = [
    Order(
        id: 1,
        customerId: 25,
        productIds: const [1, 4],
        deliveryFee: 10,
        subtotal: 40,
        total: 50,
        isDelivered: false,
        isAccepted: false,
        isCancelled: false,
        createdAt: DateTime.now()),
    Order(
        id: 2,
        customerId: 50,
        productIds: const [3, 2],
        deliveryFee: 10,
        subtotal: 20,
        total: 30,
        isDelivered: false,
        isAccepted: false,
        isCancelled: false,
        createdAt: DateTime.now())
  ];
}
