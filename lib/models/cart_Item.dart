import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class CartItems{
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItems({
    required this.food,
    required this.selectedAddons,
    required this.quantity
});

  double get totalPrice{
    double addOnPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addOnPrice) * quantity;
  }
}
