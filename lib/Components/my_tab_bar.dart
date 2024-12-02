import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    required this.tabController,
    super.key});
  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category) {
      return Tab(
        text: capitalize(category.toString().toUpperCase().split('.').last,)
      );
    }).toList();
  }
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
