import 'package:flutter/material.dart';
import 'package:food_delivery_app/Components/my_food_tile.dart';
import 'package:food_delivery_app/Components/my_sliver_appbar.dart';
import 'package:food_delivery_app/Components/my_tab_bar.dart';
import 'package:food_delivery_app/Screens/detail_screen.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../Components/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  //CHỌN RA và trả về một danh sách các thành phần Food dựa vào từng loại
  List<Food> _filterMenuByCategory (FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  //Trả về danh sách từng thành phần food trong mỗi category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.75,
          crossAxisCount: 2, // Số cột trong GridView
          crossAxisSpacing: 4.0, // Khoảng cách giữa các cột
          mainAxisSpacing: 4.0, // Khoảng cách giữa các hàng
        ),
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(), // Ngăn cuộn trong GridView con
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return MyFoodTile(
            food: categoryMenu[index],
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(food: categoryMenu[index])));
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer:MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScolled) => [
          MySliverAppBar(
              title: MyTabBar(tabController: _tabController,))
        ],
        body: Consumer<Restaurant> (
            builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu),),
        ),
        ),
      );
  }
}
