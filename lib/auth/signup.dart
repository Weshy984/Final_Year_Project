import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color(0xFFF1FAEE),
        body: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Registration", style: TextStyle(
                    fontSize: 48, fontWeight: FontWeight.w400),)
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Join us Today!", style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w400),)
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 43,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      //controller: controller,
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        hintText: "First Name",
                      ),
                    )
                )
              ],
            )

          ],
        )

    );
  }
}
