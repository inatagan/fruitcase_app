import 'package:flutter/material.dart';

class Item {
  final String id;
  final String name;
  final String description;
  final double price;

  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  // Named constructor to create an Item from a Map
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
    );
  }
}
