//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiqiti/auth/signin.dart';
import 'package:tiqiti/reusable_widgets/reusable_widgets.dart';

//import 'package:http/http.dart' as http;
//import 'package:tiqiti/reusable_widgets/toast.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{
  late TextEditingController _fNameTextController, _telephoneTextController, _cityTextController,  _emailTextController,  _passwordTextController;
  bool isSigningUp = false;
  bool processing = false;
  bool _isHidden = true;
  // final _formKey = GlobalKey<FormState>();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _fNameTextController = TextEditingController();
    _telephoneTextController = TextEditingController();
    _cityTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();


  }

  // Future signUp() async {
  //   const String signUpUrl = 'http://198.168.43.239:3000/tiqitiAPI/auth/signup.php';
  //
  //   setState(() {
  //     isSigningUp = true;
  //   });
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(signUpUrl),
  //       body: {
  //         'firstName': _fNameTextController.text,
  //         'lastName': _lNameTextController.text,
  //         'telephone': _telephoneTextController.text,
  //         'email': _emailTextController.text,
  //         'pass': _passwordTextController.text,
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Parse the response from your PHP API
  //       var data = json.decode(response.body);
  //       print(response.body);
  //       if (data is String && data == 'account already exists') {
  //         if (kDebugMode) {
  //           print("account already exists");
  //         }
  //         return showToast(message: 'An account exists! Try again later');
  //       } else if (data is List && data.length >= 4) {
  //         if (kDebugMode) {
  //           print("Yoooo! It worked!");
  //         }
  //         int userId = data[0]; // User ID
  //         String userName = data[1]; // User Name
  //         String userEmail = data[4]; // User Email
  //         print('Response Status Code: ${response.statusCode}');
  //         print('Response Body: ${response.body}');
  //         Future <void> saveUserInfo() async {
  //           SharedPreferences prefs = await SharedPreferences.getInstance();
  //           prefs.setInt('userId', userId);
  //           prefs.setString('userName', userName);
  //           prefs.setString('userEmail', userEmail);
  //         }
  //         saveUserInfo();
  //         Navigator.pushNamed(context, "/bottomBar");
  //       } else {
  //         if (kDebugMode) {
  //           print("error");
  //         }
  //         return showToast(message: 'An error occured');
  //       }
  //     } else {
  //       return showToast(message: 'An error ');
  //     }
  //   } catch (error) {
  //     return showToast(message: 'An error occured! Try again later');
  //   } finally {
  //     setState(() {
  //       isSigningUp = false;
  //     });
  //   }
  // }
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
                const Image(image: AssetImage("assets/images/logo1.jpeg")),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Form(
                      child: Column(
                        children: <Widget>[
                          makeInput(
                            label: "Full Name",
                            controller: _fNameTextController,
                            icon: Icons.person,
                            type: TextInputType.text
                          ),
                          makeInput(
                              label: "Phone Number",
                              controller: _telephoneTextController,
                              icon: Icons.phone,
                              type: TextInputType.phone
                          ),
                          makeInput(
                              label: "City",
                              controller: _cityTextController,
                              icon: Icons.location_city,
                              type: TextInputType.text
                          ),
                          makeInput(
                              label: "Email",
                              controller: _emailTextController,
                              icon: Icons.email,
                              type: TextInputType.emailAddress
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15),
                            child: TextFormField(
                              cursorColor: const Color(0xFFCFD8DC),
                              obscureText: _isHidden,
                              controller: _passwordTextController,
                              keyboardType: TextInputType.visiblePassword,
                              enableSuggestions: _isHidden,
                              autocorrect: _isHidden,
                              validator:(value){
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Password';
                                }
                                return null;
                              },
                              onSaved: (value){},
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),

                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                                  filled: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  fillColor: const Color(0xffd9d9d9),
                                  suffix: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color:Colors.black.withOpacity(0.7),
                                    ),
                                  ),

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(width: 0,style: BorderStyle.solid)
                                  )
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: processing ?
                      const CircularProgressIndicator()
                      :signInSignUpBtn(context, false, (){
                      Navigator.pushNamed(context, "/bottomBar");
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

