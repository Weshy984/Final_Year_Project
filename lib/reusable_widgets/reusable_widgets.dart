//import 'dart:js';

import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: const Color(0xFFCFD8DC),
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black.withOpacity(0.7),
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color(0xffd9d9d9),

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(width: 0,style: BorderStyle.solid)
        )
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,

  );
}

Container signInSignUpBtn (
    BuildContext context, bool isLogin, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width*0.5,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return const Color(0xff1D3557);
          }
            return const Color(0xffd9d9d9);
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
      ),
      child: Text(
        isLogin ? "Sign In" : "Sign Up",
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),

  );
}
Padding reusableTextField2(String text, IconData icon,  TextEditingController controller){
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: SizedBox(
      height: 45,
      //width: MediaQuery.of(context as BuildContext).size.width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(
                icon,
                color: const Color(0xffD9D9D9)
            ),
            // suffixIcon: const Icon(
            //   Icons.compare_arrows,
            //   color: Color(0xffE63946),
            // ),
            labelText: text,
            labelStyle: const TextStyle(color: Colors.black,
              fontSize: 20,
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.w400,),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(width: 1,style: BorderStyle.solid,color: Color(0xffd9d9d9))
            )
        ),
      ),
    ),
  );
}

