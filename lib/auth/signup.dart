import 'package:flutter/material.dart';
import 'package:tiqiti/auth/signin.dart';
import 'package:tiqiti/reusable_widgets/reusable_widgets.dart';
import 'package:tiqiti/screens/bottom_bar.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _telephoneTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0x00f1faee),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Image(image: AssetImage("assets/images/logo.png")),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: reusableTextField("First Name", Icons.person, false, _nameTextController),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: reusableTextField("Last Name", Icons.person, false, _nameTextController),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: reusableTextField("Phone Number", Icons.phone, false, _telephoneTextController),
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
                  child: reusableTextField("Password", Icons.lock, true, _passwordTextController),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: signInSignUpBtn(context, false, (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const BottomBar()));
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                signInOption(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
    );
  }
  Row signInOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const SignIn()));
          },
          child: const Text("Sign In",
            style: TextStyle(color: Color(0XFFE63946), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}