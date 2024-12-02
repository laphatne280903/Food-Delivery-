import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class DetailScreen extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons ={};
  DetailScreen({
    required this.food,
    super.key}){
    //Khởi tạo addons đã chọn là false
    for (Addon addon in food.availbleAddons){
      selectedAddons[addon] =false;
    }
  }

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  void onIncreasement() {
    setState(() {
      quantity++;
    });
  }
  void onDecreasement(){
    setState(() {
      if(quantity!=1){
        quantity--;
      }
    });
  }
  void addToCart(Food food, Map<Addon,bool> selectedAddons){
    List<Addon> currentlySelectedAddons =[];
    for(Addon addon in widget.food.availbleAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons, quantity);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset(widget.food.imagePath, width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              height: 420,),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.food.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
                    textAlign: TextAlign.end,),
                    SizedBox(height: 30,),
        
                  //Description
                    Text(widget.food.description, style: TextStyle(fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),),

                    //Addons
                    SizedBox(height: 20,),
                    Text("Add-ons:", style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary)),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.2,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.availbleAddons.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          Addon addons = widget.food.availbleAddons[index];
                          return CheckboxListTile(

                            title: Text(addons.name),
                            subtitle: Text("\$ " + addons.price.toString()),
                            value: widget.selectedAddons[addons],
                            onChanged: (bool? value){
                              setState(() {
                                widget.selectedAddons[addons]=value!;
                              });
                            } ,
                          );
                      },),
                    ),
                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price: \$' + widget.food.price.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary)
                        ),
                        Card(
                          child: Row(
                            children: [
                              IconButton(onPressed: (){
                                onDecreasement();
                              }, icon: Icon(Icons.remove_outlined)),
                              Container(
                                constraints: BoxConstraints(
                                  minWidth: 25,
                                  maxWidth: 40,
                                ),
                                  child: Text(quantity.toString(), style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,)),
                              IconButton(onPressed: (){
                                onIncreasement();
                              }, icon: Icon(Icons.add)),

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),

                    //Add to cart
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          minimumSize: Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                        onPressed: (){
                          addToCart(widget.food, widget.selectedAddons);
                          Navigator.pop(context);
                          showDialog(context: context,
                              builder: (BuildContext context){
                            return CupertinoAlertDialog(
                              title: const Text("Added to Cart"),
                            );
                          });
                        },
                        child: Text("Add to cart",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                          color: Colors.white),)),
                    SizedBox(height: 10,),

                    //Favourite
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 0.9,
                              color: Colors.black54
                            ),
                            backgroundColor: Colors.white,
                            minimumSize: Size(MediaQuery.of(context).size.width, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        onPressed: (){

                        },
                        child: Text("Favourite",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                              color: Colors.black87))),

                  ]),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

}

