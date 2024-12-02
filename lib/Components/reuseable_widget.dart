import 'package:flutter/material.dart';

TextField SigninSignupTextField (BuildContext context, String text, IconData icon, bool isPassword, TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPassword,
    autocorrect: !isPassword,
    enableSuggestions: !isPassword,
    cursorColor: Theme.of(context).colorScheme.inversePrimary,
    style: TextStyle(
      color: Colors.black,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.grey.shade700),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black54),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPassword? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container AuthenticationButton (BuildContext context, String title, Function ontap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),),
    child: ElevatedButton(
      onPressed: (){
        ontap();
      },
      child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if(states.contains(MaterialState.pressed)){return Colors.deepOrangeAccent;}
          return Colors.yellow[600];
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),
    ),
  );
}