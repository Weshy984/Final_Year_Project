import 'package:flutter/material.dart';
import 'package:tiqiti/auth/signup.dart';

import '../reusable_widgets/reusable_widgets.dart';
import '../screens/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0x00f1faee),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                const Center(
                    child: Image(image: AssetImage("assets/images/logo1.jpeg"))
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: reusableTextField("E-mail", Icons.mail, false, _emailTextController),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: reusableTextField("Password", Icons.lock, false, _passwordTextController),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: signInSignUpBtn(context, true, (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),

    );
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const SignUpScreen()));
          },
          child: const Text("Sign Up",
            style: TextStyle(color: Color(0XFFE63946), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}