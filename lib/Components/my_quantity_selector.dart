import 'package:flutter/material.dart';

import '../models/food.dart';

class QuantitySeclector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncreasement;
  final VoidCallback onDecreasement;
  const QuantitySeclector({
    required this.quantity,
    required this.food,
    required this.onDecreasement,
    required this.onIncreasement,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
          width: 01
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){onDecreasement();},
            onLongPress: (){onDecreasement();},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Icon(Icons.remove_outlined, size: 15,),
            ),
          ),
          Text(quantity.toString(), style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center, maxLines: 2,),
          GestureDetector(
            onTap: (){onIncreasement();},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Icon(Icons.add, size: 15,),
            ),
          ),
        ],
      ),
    );
  }
}
