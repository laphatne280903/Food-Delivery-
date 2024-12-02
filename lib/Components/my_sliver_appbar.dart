import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/cart_screen.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget title;
  const MySliverAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      expandedHeight: 100,
      collapsedHeight: 80,
      floating: true,
      pinned: true,
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
        }, icon: Icon(Icons.shopping_cart_outlined)),
      ],
      title: Text("Barbori Restaurant"),
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
