

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Components/my_cart_tile.dart';
import 'package:food_delivery_app/Screens/payment_screen.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context,restaurant, child){
          final userCart = restaurant.cart;

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Cart", style: TextStyle(
                  fontWeight: FontWeight.bold),),
              backgroundColor: Colors.transparent,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                TextButton(onPressed: (){
                  if(userCart.isEmpty){return;}
                  else{
                    showDialog(context: context, builder: (context) => AlertDialog(
                      title: const Text("Are you sure want to clear the cart?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,),),
                      actions: [
                        //Cancel action
                        TextButton(onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel",
                              style: TextStyle(color: Colors.black87),)),

                        //Confirm Clear
                        TextButton(onPressed: (){
                          restaurant.clearCart();
                          Navigator.pop(context);
                        },
                            child: const Text("Confirm", style: TextStyle(color: Colors.black87),)),

                      ],
                    ));

                  }
                },
                    child: const Text('Clear', style: TextStyle(
                      color: Colors.black54,
                    ),)),
              ],
            ),
            body: Column(
              children: [
                userCart.isEmpty?
                const Expanded(child: Center(child: Text("Cart empty..."))):
                Expanded(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemCount: userCart.length,
                        itemBuilder: (context, index) {
                        //get individual cart item
                        final cartItem = userCart[index];

                        //return cart tile UI
                        return MyCartTile(cartItems: cartItem, );
                        }),
                  ),
                ),


                // Container(
                //   padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                //   height: 30,
                //   width: MediaQuery.of(context).size.width,
                //   child: Text("${getTotalPrice().toString()}"),),


                Container(
                  padding: EdgeInsets.fromLTRB(8,8,8,16),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                    ),
                  onPressed: (){
                      if(userCart.isEmpty){
                        return;
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));

                      }
                  }, child: const Text("Go to checkout", style: TextStyle(
                      color: Colors.white,
                    fontSize: 18, fontWeight: FontWeight.bold),)),
                )
              ],
            ),
          );
        });
  }
}
