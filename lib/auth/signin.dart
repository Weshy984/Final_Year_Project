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
  late TextEditingController _emailTextController, _passwordTextController;
  bool processing = false;
  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
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
                  padding: EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Form(
                    key: _formKey,
                    child:Column(
                      children: <Widget>[
                        makeInput(
                          label: "E-mail",
                          icon: Icons.email,
                          type: TextInputType.emailAddress,
                          controller: _emailTextController
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
                  child: processing
                      ? CircularProgressIndicator()
                      :signInSignUpBtn(context, true, (){
                        if(_formKey.currentState!.validate()){
                          processing=true;
                          Navigator.pushNamed(context, "/home");
                        }
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