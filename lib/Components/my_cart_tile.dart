import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/cart_Item.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItems cartItems;
  const MyCartTile({required this.cartItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child){
          return Container(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(cartItems.food.imagePath,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,),),
                    //food name
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItems.food.name, maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary,),),
                            Text("\$"+ cartItems.food.price.toString(), style: TextStyle(
                                fontSize: 15, color: Theme.of(context).colorScheme.inversePrimary),),
                          ],
                        ),
                      ),
                    ),
                    // //increase or decrease the quantity tile
                    QuantitySeclector(quantity: cartItems.quantity,
                        food: cartItems.food,
                        onDecreasement: (){
                          restaurant.removeQuantity(cartItems);
                        },
                        onIncreasement: (){
                          restaurant.addToCart(cartItems.food, cartItems.selectedAddons, cartItems.quantity);
                        }),

                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(3),
                            child: IconButton(onPressed: (){
                              restaurant.removeFromCart(cartItems);
                            }, icon: Icon(Icons.close, size: 18,),
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.zero,),
                          ),
                        ],
                      ),
                    ),],
                ),
                SizedBox(
                  height: cartItems.selectedAddons.isEmpty? 0:50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cartItems.selectedAddons.map((addon) =>
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,8,8,0),
                          child: FilterChip(
                            label: Row(
                              children: [
                                Text(addon.name+": \$", style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary,
                                  fontSize: 14
                                ),),
                                Text(addon.price.toString(), style: TextStyle(
                                    color: Theme.of(context).colorScheme.inversePrimary,
                                    fontSize: 14, fontStyle: FontStyle.italic,
                                ),),
                              ],
                            ),
                            onSelected: (value){}
                          ),
                        )).toList(),
                  ),
                ),
                SizedBox(height: 12,),
                Divider(height: 1, thickness: 1, color: CupertinoColors.systemGrey2,),

              ],
            ),
          );
        });
  }
}
