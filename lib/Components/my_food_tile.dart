import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? ontap;
  const MyFoodTile({super.key, required this.food, required this.ontap});
  @override
  Widget build(BuildContext context) {
    List<String> addondescription = [];

    return Card(
      elevation: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ), // Đặt bán kính bo tròn
              child: Image.asset(
                food.imagePath,
                fit: BoxFit.cover,
                height: 150,
                width: MediaQuery.of(context).size.width,// Đảm bảo hình ảnh phủ kín diện tích của widget
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: ontap,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(food.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),),

                    Text(food.description, maxLines: 1, style: TextStyle(fontSize: 14),),

                    Spacer(),

                    Text("\$ " + food.price.toString(),style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
