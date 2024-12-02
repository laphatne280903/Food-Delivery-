import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.secondary
            ),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode ", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),),
                CupertinoSwitch(value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                    onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
