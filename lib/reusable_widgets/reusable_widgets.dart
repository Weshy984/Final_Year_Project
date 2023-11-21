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
        fillColor: Colors.grey,

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
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),

  );
}