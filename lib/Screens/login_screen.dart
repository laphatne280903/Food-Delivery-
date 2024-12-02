
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Components/color_utils.dart';
import 'package:food_delivery_app/Screens/forgot_screen.dart';
import 'package:food_delivery_app/Screens/home_screen.dart';
import 'package:food_delivery_app/Screens/signup_screen.dart';
import 'package:food_delivery_app/Components/reuseable_widget.dart';
import 'package:food_delivery_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailSigninTextField = TextEditingController();
  TextEditingController _passwordTextfield = TextEditingController();
  void login() async {
    final _authService = AuthService();
    //try sign in
    try{
      await _authService.signInWithEmailPassword(_emailSigninTextField.text, _passwordTextfield.text).then((value) {
        Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen()));
      });;
    }
    //display any error
    catch (e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  hexStringColor("e25822"),
                  hexStringColor("ff7f50"),
                  hexStringColor("ffe5b4"),
                ],
                begin: Alignment.bottomLeft,
                end:  Alignment.topRight
            )
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.1, 0, 0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              children: <Widget>[
                Image.asset("images/icons/fooddeliveryIcon.png",
                height: 200, width: 200,),
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
                SigninSignupTextField(context, "Enter Password", Icons.lock_rounded, true, _passwordTextfield),
                ForgotPassword(context),
                AuthenticationButton(context, "Login", (){
                  login();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account? ", style: TextStyle(fontSize: 15),),
                    GestureDetector(
                      child: Text("Register now", style: TextStyle(color: Colors.yellow[200], fontWeight: FontWeight.bold, fontSize: 15),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
  Widget ForgotPassword (BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ResetPassword()));
        }, child: Text("Forgot password?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 15,
      fontStyle: FontStyle.italic),),
      )
    );
  }

  Widget backgroundColor (){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            hexStringColor("e25822"),
            hexStringColor("ff7f50"),
            hexStringColor("ffe5b4"),

          ]
        )
      ),
    );
  }
}