import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/login_screen.dart';

import '../Components/reuseable_widget.dart';
import 'home_screen.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailSigninTextField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.15, 0, 20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: <Widget>[
              Image.asset("images/icons/fooddeliveryIcon.png",
                height: 200, width: 200,),
              //Message, slogan
              SizedBox(height: 10,),
              //Message, slogan
              Text("Fast food, fast delivery!", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 18,
                color: Colors.green[800],),),

              SizedBox(height: 20,),
              SigninSignupTextField(context, "Enter Email", Icons.person, false, _emailSigninTextField),
              SizedBox(height: 18,),
              AuthenticationButton(context, "Send Vertification", (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Back to "),
                  GestureDetector(
                    child: Text("Login now", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                  ),
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}

