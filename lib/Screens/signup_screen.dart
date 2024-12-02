import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/home_screen.dart';
import 'package:food_delivery_app/Screens/login_screen.dart';
import 'package:food_delivery_app/services/auth_service.dart';

import '../Components/color_utils.dart';
import '../Components/reuseable_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});


  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _userNameTextField = TextEditingController();
  TextEditingController _emailSigninTextField = TextEditingController();
  TextEditingController _passwordTextfield = TextEditingController();
  TextEditingController _confirmPasswordTextField = TextEditingController();

  //register method
  void register() async{
    final _authService = AuthService();

    //check if password match then create user
    if(_passwordTextfield.text == _confirmPasswordTextField.text){
      try {
        await _authService.signUpWithEmailPassword(_emailSigninTextField.text, _passwordTextfield.text).then((value) {
          Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen()));
        });

      } catch(e){
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
      }
    } else {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Can not indentify the password, please try again!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
          padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.1, 0, 20),
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
                SigninSignupTextField(context, "Enter Username", Icons.person, false, _userNameTextField),
                SizedBox(height: 18,),
                SigninSignupTextField(context, "Enter Email", Icons.email_rounded, false, _emailSigninTextField),
                SizedBox(height: 18,),
                SigninSignupTextField(context, "Enter Password", Icons.lock_rounded, true, _passwordTextfield),
                SizedBox(height: 18,),
                SigninSignupTextField(context, "Confirm Password", Icons.lock_rounded, true, _confirmPasswordTextField),
                SizedBox(height: 18,),
                AuthenticationButton(context, "Create Account", (){
                  register();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have account? ", style: TextStyle(fontSize: 15),),
                    GestureDetector(
                      child: Text("Login now", style: TextStyle(color: Colors.yellow[300], fontWeight: FontWeight.bold, fontSize: 15),),
                      onTap: (){
                        Navigator.pop(context);
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
}
